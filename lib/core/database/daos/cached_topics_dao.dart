import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cached_topics.dart';

part 'cached_topics_dao.g.dart';

@DriftAccessor(tables: [CachedTopics])
class CachedTopicsDao extends DatabaseAccessor<AppDatabase>
    with _$CachedTopicsDaoMixin {
  CachedTopicsDao(super.db);

  Future<List<CachedTopic>> getAll() => (select(cachedTopics)
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<List<CachedTopic>> getActive() => (select(cachedTopics)
        ..where((t) => t.isActive.equals(true))
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<CachedTopic?> getById(int id) =>
      (select(cachedTopics)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<CachedTopic?> getBySlug(String slug) =>
      (select(cachedTopics)..where((t) => t.slug.equals(slug)))
          .getSingleOrNull();

  Future<int> insert(CachedTopicsCompanion entry) =>
      into(cachedTopics).insert(entry);

  Future<bool> updateEntry(CachedTopic entry) =>
      update(cachedTopics).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(cachedTopics)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(cachedTopics).go();

  Future<void> reorder(List<int> orderedIds) async {
    await batch((b) {
      for (var i = 0; i < orderedIds.length; i++) {
        b.update(
          cachedTopics,
          CachedTopicsCompanion(sortOrder: Value(i)),
          where: (t) => t.id.equals(orderedIds[i]),
        );
      }
    });
  }
}
