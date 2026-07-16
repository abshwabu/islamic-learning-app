import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../content/providers/content_sync_provider.dart';
import '../../settings/models/app_settings_keys.dart';
import '../models/home_models.dart';

final homeSearchQueryProvider = StateProvider<String>((ref) => '');

final homeBrowseModeProvider =
    AsyncNotifierProvider<HomeBrowseModeNotifier, HomeBrowseMode>(
  HomeBrowseModeNotifier.new,
);

class HomeBrowseModeNotifier extends AsyncNotifier<HomeBrowseMode> {
  @override
  Future<HomeBrowseMode> build() async {
    final setting = await ref
        .read(databaseProvider)
        .settingsDao
        .getByKey(AppSettingsKeys.homeBrowseMode);
    return HomeBrowseMode.fromSetting(setting?.value);
  }

  Future<void> setMode(HomeBrowseMode mode) async {
    state = AsyncData(mode);
    await ref.read(databaseProvider).settingsDao.upsert(
          SettingsCompanion(
            key: const Value(AppSettingsKeys.homeBrowseMode),
            value: Value(mode.settingValue),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }
}

final dersCountByUstazProvider = FutureProvider<Map<int, int>>((ref) async {
  final derses = await ref.watch(publishedDersesProvider.future);
  final counts = <int, int>{};
  for (final ders in derses) {
    counts[ders.ustazId] = (counts[ders.ustazId] ?? 0) + 1;
  }
  return counts;
});

final dersCountByTopicProvider = FutureProvider<Map<int, int>>((ref) async {
  final derses = await ref.watch(publishedDersesProvider.future);
  final counts = <int, int>{};
  for (final ders in derses) {
    final topicId = ders.topicId;
    if (topicId == null) continue;
    counts[topicId] = (counts[topicId] ?? 0) + 1;
  }
  return counts;
});

final continueListeningProvider =
    FutureProvider<List<ContinueListeningItem>>((ref) async {
  final db = ref.watch(databaseProvider);
  final progressList = await db.progressDao.getRecentIncomplete();
  final items = <ContinueListeningItem>[];

  for (final progress in progressList) {
    final episode = await db.cachedEpisodesDao.getById(progress.episodeId);
    if (episode == null || !episode.isPublished) continue;

    final ders = await db.cachedDersesDao.getById(episode.dersId);
    if (ders == null || !ders.isPublished) continue;

    items.add(
      ContinueListeningItem(
        progress: progress,
        episode: episode,
        ders: ders,
      ),
    );
  }

  return items;
});

final filteredUstazesProvider = FutureProvider<List<CachedUstaze>>((ref) async {
  final query = ref.watch(homeSearchQueryProvider).trim().toLowerCase();
  final ustazes = await ref.watch(activeUstazesProvider.future);
  if (query.isEmpty) return ustazes;

  final derses = await ref.watch(publishedDersesProvider.future);
  final matchingIds = <int>{};

  for (final ustaz in ustazes) {
    if (ustaz.name.toLowerCase().contains(query)) {
      matchingIds.add(ustaz.id);
    }
  }
  for (final ders in derses) {
    if (ders.title.toLowerCase().contains(query)) {
      matchingIds.add(ders.ustazId);
    }
  }

  return ustazes.where((ustaz) => matchingIds.contains(ustaz.id)).toList();
});

final filteredTopicsProvider = FutureProvider<List<CachedTopic>>((ref) async {
  final query = ref.watch(homeSearchQueryProvider).trim().toLowerCase();
  final topics = await ref.watch(activeTopicsProvider.future);
  if (query.isEmpty) return topics;

  final derses = await ref.watch(publishedDersesProvider.future);
  final matchingIds = <int>{};

  for (final topic in topics) {
    if (topic.name.toLowerCase().contains(query)) {
      matchingIds.add(topic.id);
    }
  }
  for (final ders in derses) {
    final topicId = ders.topicId;
    if (topicId != null && ders.title.toLowerCase().contains(query)) {
      matchingIds.add(topicId);
    }
  }

  return topics.where((topic) => matchingIds.contains(topic.id)).toList();
});

final matchingDersesProvider = FutureProvider<List<CachedDers>>((ref) async {
  final query = ref.watch(homeSearchQueryProvider).trim().toLowerCase();
  if (query.isEmpty) return [];

  final derses = await ref.watch(publishedDersesProvider.future);
  return derses
      .where((ders) => ders.title.toLowerCase().contains(query))
      .toList();
});
