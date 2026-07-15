import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../network/api_constants.dart';
import '../network/dio_client.dart';
import '../../models/content_response.dart';

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(
    dio: ref.watch(dioProvider),
    db: ref.watch(databaseProvider),
  );
});

class ContentRepository {
  ContentRepository({
    required Dio dio,
    required AppDatabase db,
  })  : _dio = dio,
        _db = db;

  final Dio _dio;
  final AppDatabase _db;

  Future<ContentResponse> fetchContent() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiConstants.contentEndpoint);
    final data = response.data;
    if (data == null) {
      throw const FormatException('Empty content response');
    }
    return ContentResponse.fromJson(data);
  }

  Future<void> syncContent() async {
    final content = await fetchContent();
    await upsertContent(content);
  }

  Future<void> upsertContent(ContentResponse content) async {
    final now = DateTime.now();
    final ustazIds = <int>{};
    final topicIds = <int>{};
    final dersIds = <int>{};
    final episodeIds = <int>{};
    final episodeCompanions = <CachedEpisodesCompanion>[];

    await _db.transaction(() async {
      for (final ustaz in content.ustazes) {
        ustazIds.add(ustaz.id);
        await _db.cachedUstazesDao.upsert(
          CachedUstazesCompanion(
            id: Value(ustaz.id),
            name: Value(ustaz.name),
            slug: Value(ustaz.slug),
            bio: Value(ustaz.bio),
            photoUrl: Value(ustaz.photoUrl),
            sortOrder: Value(ustaz.sortOrder),
            isActive: Value(ustaz.isActive),
            cachedAt: Value(now),
          ),
        );
      }
      await _db.cachedUstazesDao.deactivateNotIn(ustazIds);

      for (final topic in content.topics) {
        topicIds.add(topic.id);
        await _db.cachedTopicsDao.upsert(
          CachedTopicsCompanion(
            id: Value(topic.id),
            name: Value(topic.name),
            slug: Value(topic.slug),
            icon: Value(topic.icon),
            color: Value(topic.color),
            sortOrder: Value(topic.sortOrder),
            isActive: Value(topic.isActive),
            cachedAt: Value(now),
          ),
        );
      }
      await _db.cachedTopicsDao.deactivateNotIn(topicIds);

      for (final ders in content.derses) {
        dersIds.add(ders.id);
        await _db.cachedDersesDao.upsert(
          CachedDersesCompanion(
            id: Value(ders.id),
            title: Value(ders.title),
            slug: Value(ders.slug),
            description: Value(ders.description),
            coverImageUrl: Value(ders.coverImageUrl),
            pdfUrl: Value(ders.pdfUrl),
            pdfPageCount: Value(ders.pdfPageCount),
            ustazId: Value(ders.ustazId),
            topicId: Value(ders.topicId),
            sortOrder: Value(ders.sortOrder),
            isPublished: Value(ders.isPublished),
            cachedAt: Value(now),
          ),
        );

        for (final episode in ders.episodes) {
          episodeIds.add(episode.id);
          episodeCompanions.add(
            CachedEpisodesCompanion(
              id: Value(episode.id),
              dersId: Value(episode.dersId),
              title: Value(episode.title),
              audioUrl: Value(episode.audioUrl),
              startPage: Value(episode.startPage),
              endPage: Value(episode.endPage),
              durationSeconds: Value(episode.durationSeconds),
              sortOrder: Value(episode.sortOrder),
              isPublished: Value(episode.isPublished),
              cachedAt: Value(now),
            ),
          );
        }
      }
      await _db.cachedDersesDao.unpublishNotIn(dersIds);
    });

    await _db.cachedEpisodesDao.syncUpsertAll(episodeCompanions);
    await _db.cachedEpisodesDao.unpublishNotIn(episodeIds);
  }
}
