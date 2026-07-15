import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../../core/database/database.dart';
import '../../home/providers/home_providers.dart';
import '../../derses/providers/derses_providers.dart';
import '../models/player_session_state.dart';
import '../services/pdf_cache_service.dart';

final playerSessionProvider =
    StateNotifierProvider<PlayerSessionNotifier, PlayerSessionState>((ref) {
  ref.keepAlive();
  final notifier = PlayerSessionNotifier(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});

class PlayerSessionNotifier extends StateNotifier<PlayerSessionState> {
  PlayerSessionNotifier(this._ref) : super(const PlayerSessionState()) {
    _init();
  }

  final Ref _ref;
  final AudioPlayer player = AudioPlayer();
  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<Duration>? _positionSub;
  Timer? _sleepTimer;
  DateTime? _lastPositionSaveAt;
  int? _loadingEpisodeId;

  AppDatabase get _db => _ref.read(databaseProvider);

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    _playerStateSub = player.playerStateStream.listen(_onPlayerStateChanged);
    _positionSub = player.positionStream.listen(_onPositionChanged);
  }

  Future<void> loadEpisode(int episodeId) async {
    if (_loadingEpisodeId == episodeId && state.isLoading) return;

    _loadingEpisodeId = episodeId;
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final episode = await _db.cachedEpisodesDao.getById(episodeId);
      if (episode == null) {
        throw StateError('Episode not found');
      }

      final ders = await _db.cachedDersesDao.getById(episode.dersId);
      if (ders == null) {
        throw StateError('Ders not found');
      }

      final episodes =
          await _db.cachedEpisodesDao.getPublishedByDersId(ders.id);
      final currentIndex = episodes.indexWhere((item) => item.id == episode.id);
      if (currentIndex < 0) {
        throw StateError('Episode is not published');
      }

      final ustaz = await _db.cachedUstazesDao.getById(ders.ustazId);
      String? pdfPath = state.pdfPath;
      var pdfVersion = state.pdfVersion;

      if (state.ders?.id != ders.id || pdfPath == null) {
        final pdfFile =
            await _ref.read(pdfCacheServiceProvider).resolvePdfFile(ders);
        pdfPath = pdfFile.path;
        pdfVersion++;
      }

      final audioSource = await _resolveAudioSource(
        episode: episode,
        ders: ders,
        artist: ustaz?.name ?? 'Islamic Learning',
      );

      await player.setSpeed(state.playbackSpeed);
      await player.setAudioSource(audioSource);

      final savedProgress = await _db.progressDao.getByEpisodeId(episode.id);
      final startPosition = savedProgress != null && !savedProgress.isCompleted
          ? Duration(seconds: savedProgress.positionSeconds)
          : Duration.zero;
      await player.seek(startPosition);

      state = state.copyWith(
        episode: episode,
        ders: ders,
        episodes: episodes,
        currentIndex: currentIndex,
        isLoading: false,
        pdfPath: pdfPath,
        pdfTargetPage: episode.startPage,
        pdfVersion: pdfVersion,
        clearError: true,
      );

      await player.play();
      await _saveProgress(
        episodeId: episode.id,
        positionSeconds: startPosition.inSeconds,
        isCompleted: false,
      );
    } on Object catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    } finally {
      _loadingEpisodeId = null;
    }
  }

  Future<AudioSource> _resolveAudioSource({
    required CachedEpisode episode,
    required CachedDers ders,
    required String artist,
  }) async {
    final mediaItem = MediaItem(
      id: 'episode_${episode.id}',
      album: ders.title,
      title: episode.title,
      artist: artist,
      artUri:
          ders.coverImageUrl != null ? Uri.tryParse(ders.coverImageUrl!) : null,
      duration: episode.durationSeconds > 0
          ? Duration(seconds: episode.durationSeconds)
          : null,
    );

    final download = await _db.downloadsDao.getByEpisodeId(episode.id);
    if (download != null && download.status == 'completed') {
      return AudioSource.file(
        download.localPath,
        tag: mediaItem,
      );
    }

    return AudioSource.uri(
      Uri.parse(episode.audioUrl),
      tag: mediaItem,
    );
  }

  Future<void> togglePlayPause() async {
    if (player.playing) {
      await player.pause();
      await _persistCurrentPosition(markCompleted: false);
      return;
    }
    await player.play();
  }

  Future<void> seek(Duration position) async {
    await player.seek(position);
    await _persistCurrentPosition(markCompleted: false);
  }

  Future<void> skipNext() async {
    if (!state.hasNext) return;
    await loadEpisode(state.episodes[state.currentIndex + 1].id);
  }

  Future<void> skipPrevious() async {
    if (player.position > const Duration(seconds: 3)) {
      await seek(Duration.zero);
      return;
    }
    if (!state.hasPrevious) {
      await seek(Duration.zero);
      return;
    }
    await loadEpisode(state.episodes[state.currentIndex - 1].id);
  }

  Future<void> setSpeed(double speed) async {
    state = state.copyWith(playbackSpeed: speed);
    await player.setSpeed(speed);
  }

  void setSleepTimer(Duration? duration) {
    _sleepTimer?.cancel();
    _sleepTimer = null;

    if (duration == null) {
      state = state.copyWith(clearSleepTimer: true);
      return;
    }

    final endsAt = DateTime.now().add(duration);
    state = state.copyWith(sleepTimerEndsAt: endsAt);
    _sleepTimer = Timer(duration, () async {
      await player.pause();
      state = state.copyWith(clearSleepTimer: true);
    });
  }

  void _onPlayerStateChanged(PlayerState playerState) {
    if (playerState.processingState == ProcessingState.completed) {
      unawaited(_handlePlaybackCompleted());
    }
  }

  void _onPositionChanged(Duration position) {
    final episode = state.episode;
    if (episode == null || !player.playing) return;

    final now = DateTime.now();
    if (_lastPositionSaveAt != null &&
        now.difference(_lastPositionSaveAt!) < const Duration(seconds: 3)) {
      return;
    }
    _lastPositionSaveAt = now;
    unawaited(
      _saveProgress(
        episodeId: episode.id,
        positionSeconds: position.inSeconds,
        isCompleted: false,
      ),
    );
  }

  Future<void> _handlePlaybackCompleted() async {
    final episode = state.episode;
    if (episode == null) return;

    final durationSeconds =
        player.duration?.inSeconds ?? episode.durationSeconds;
    await _saveProgress(
      episodeId: episode.id,
      positionSeconds: durationSeconds,
      isCompleted: true,
    );

    _ref.invalidate(episodesWithProgressProvider(episode.dersId));
    _ref.invalidate(continueListeningProvider);

    if (state.hasNext) {
      await loadEpisode(state.episodes[state.currentIndex + 1].id);
      return;
    }

    await player.pause();
    await player.seek(Duration.zero);
  }

  Future<void> _persistCurrentPosition({required bool markCompleted}) async {
    final episode = state.episode;
    if (episode == null) return;

    await _saveProgress(
      episodeId: episode.id,
      positionSeconds: player.position.inSeconds,
      isCompleted: markCompleted,
    );
  }

  Future<void> _saveProgress({
    required int episodeId,
    required int positionSeconds,
    required bool isCompleted,
  }) async {
    await _db.progressDao.upsertProgress(
      episodeId: episodeId,
      positionSeconds: positionSeconds,
      isCompleted: isCompleted,
    );
  }

  @override
  void dispose() {
    _sleepTimer?.cancel();
    _playerStateSub?.cancel();
    _positionSub?.cancel();
    player.dispose();
    super.dispose();
  }
}
