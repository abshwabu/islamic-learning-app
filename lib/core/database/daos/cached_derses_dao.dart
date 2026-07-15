import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cached_derses.dart';

part 'cached_derses_dao.g.dart';

@DriftAccessor(tables: [CachedDerses])
class CachedDersesDao extends DatabaseAccessor<AppDatabase>
    with _$CachedDersesDaoMixin {
  CachedDersesDao(super.db);

  Future<List<CachedDers>> getAll() => (select(cachedDerses)
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<List<CachedDers>> getPublished() => (select(cachedDerses)
        ..where((t) => t.isPublished.equals(true))
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<CachedDers?> getById(int id) =>
      (select(cachedDerses)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<CachedDers?> getBySlug(String slug) =>
      (select(cachedDerses)..where((t) => t.slug.equals(slug)))
          .getSingleOrNull();

  Future<List<CachedDers>> getByUstazId(int ustazId) =>
      (select(cachedDerses)
            ..where((t) => t.ustazId.equals(ustazId))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();

  Future<List<CachedDers>> getByTopicId(int topicId) =>
      (select(cachedDerses)
            ..where((t) => t.topicId.equals(topicId))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();

  Future<int> insert(CachedDersesCompanion entry) =>
      into(cachedDerses).insert(entry);

  Future<bool> updateEntry(CachedDers entry) =>
      update(cachedDerses).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(cachedDerses)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(cachedDerses).go();

  Future<void> reorder(List<int> orderedIds) async {
    await batch((b) {
      for (var i = 0; i < orderedIds.length; i++) {
        b.update(
          cachedDerses,
          CachedDersesCompanion(sortOrder: Value(i)),
          where: (t) => t.id.equals(orderedIds[i]),
        );
      }
    });
  }
}
