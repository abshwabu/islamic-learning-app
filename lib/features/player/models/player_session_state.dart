import '../../../core/database/database.dart';

class PlayerSessionState {
  const PlayerSessionState({
    this.episode,
    this.ders,
    this.episodes = const [],
    this.currentIndex = 0,
    this.isLoading = false,
    this.errorMessage,
    this.playbackSpeed = 1.0,
    this.sleepTimerEndsAt,
    this.pdfPath,
    this.pdfTargetPage = 1,
    this.pdfVersion = 0,
  });

  final CachedEpisode? episode;
  final CachedDers? ders;
  final List<CachedEpisode> episodes;
  final int currentIndex;
  final bool isLoading;
  final String? errorMessage;
  final double playbackSpeed;
  final DateTime? sleepTimerEndsAt;
  final String? pdfPath;
  final int pdfTargetPage;
  final int pdfVersion;

  bool get hasEpisode => episode != null;
  bool get hasNext => currentIndex < episodes.length - 1;
  bool get hasPrevious => currentIndex > 0;

  PlayerSessionState copyWith({
    CachedEpisode? episode,
    CachedDers? ders,
    List<CachedEpisode>? episodes,
    int? currentIndex,
    bool? isLoading,
    String? errorMessage,
    double? playbackSpeed,
    DateTime? sleepTimerEndsAt,
    bool clearSleepTimer = false,
    String? pdfPath,
    int? pdfTargetPage,
    int? pdfVersion,
    bool clearError = false,
    bool clearPdfPath = false,
  }) {
    return PlayerSessionState(
      episode: episode ?? this.episode,
      ders: ders ?? this.ders,
      episodes: episodes ?? this.episodes,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      sleepTimerEndsAt: clearSleepTimer
          ? null
          : (sleepTimerEndsAt ?? this.sleepTimerEndsAt),
      pdfPath: clearPdfPath ? null : (pdfPath ?? this.pdfPath),
      pdfTargetPage: pdfTargetPage ?? this.pdfTargetPage,
      pdfVersion: pdfVersion ?? this.pdfVersion,
    );
  }
}
