import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../models/derses_models.dart';

final dersesByUstazProvider =
    FutureProvider.family<List<CachedDers>, int>((ref, ustazId) async {
  final db = ref.watch(databaseProvider);
  final derses = await db.cachedDersesDao.getByUstazId(ustazId);
  return derses.where((ders) => ders.isPublished).toList();
});

final dersesByTopicProvider =
    FutureProvider.family<List<CachedDers>, int>((ref, topicId) async {
  final db = ref.watch(databaseProvider);
  final derses = await db.cachedDersesDao.getByTopicId(topicId);
  return derses.where((ders) => ders.isPublished).toList();
});

final ustazNameProvider = FutureProvider.family<String?, int>((ref, ustazId) async {
  final ustaz = await ref.watch(databaseProvider).cachedUstazesDao.getById(ustazId);
  return ustaz?.name;
});

final topicNameProvider = FutureProvider.family<String?, int>((ref, topicId) async {
  final topic = await ref.watch(databaseProvider).cachedTopicsDao.getById(topicId);
  return topic?.name;
});

final dersDetailProvider =
    FutureProvider.family<CachedDers?, int>((ref, dersId) async {
  return ref.watch(databaseProvider).cachedDersesDao.getById(dersId);
});

final publishedEpisodeCountProvider =
    FutureProvider.family<int, int>((ref, dersId) async {
  final episodes = await ref
      .watch(databaseProvider)
      .cachedEpisodesDao
      .getPublishedByDersId(dersId);
  return episodes.length;
});

final dersDownloadStatusProvider =
    FutureProvider.family<DersDownloadStatus, int>((ref, dersId) async {
  final db = ref.watch(databaseProvider);
  final episodes = await db.cachedEpisodesDao.getPublishedByDersId(dersId);
  if (episodes.isEmpty) return DersDownloadStatus.none;

  final episodeIds = episodes.map((e) => e.id).toSet();
  final downloadedIds = await db.downloadsDao.getDownloadedEpisodeIds(episodeIds);

  if (downloadedIds.isEmpty) return DersDownloadStatus.none;
  if (downloadedIds.length >= episodes.length) {
    return DersDownloadStatus.downloaded;
  }
  return DersDownloadStatus.partial;
});

final episodesWithProgressProvider =
    FutureProvider.family<List<EpisodeWithProgress>, int>((ref, dersId) async {
  final db = ref.watch(databaseProvider);
  final episodes = await db.cachedEpisodesDao.getPublishedByDersId(dersId);
  final items = <EpisodeWithProgress>[];

  for (final episode in episodes) {
    final progress = await db.progressDao.getByEpisodeId(episode.id);
    final download = await db.downloadsDao.getByEpisodeId(episode.id);
    items.add(
      EpisodeWithProgress(
        episode: episode,
        isCompleted: progress?.isCompleted ?? false,
        isDownloaded: download != null,
      ),
    );
  }

  return items;
});

final isDersFullyDownloadedProvider =
    FutureProvider.family<bool, int>((ref, dersId) async {
  final status = await ref.watch(dersDownloadStatusProvider(dersId).future);
  return status == DersDownloadStatus.downloaded;
});
