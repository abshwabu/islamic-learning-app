import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cached_ustazes.dart';

part 'cached_ustazes_dao.g.dart';

@DriftAccessor(tables: [CachedUstazes])
class CachedUstazesDao extends DatabaseAccessor<AppDatabase>
    with _$CachedUstazesDaoMixin {
  CachedUstazesDao(super.db);

  Future<List<CachedUstaze>> getAll() => (select(cachedUstazes)
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<List<CachedUstaze>> getActive() => (select(cachedUstazes)
        ..where((t) => t.isActive.equals(true))
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<CachedUstaze?> getById(int id) =>
      (select(cachedUstazes)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<CachedUstaze?> getBySlug(String slug) =>
      (select(cachedUstazes)..where((t) => t.slug.equals(slug)))
          .getSingleOrNull();

  Future<int> insert(CachedUstazesCompanion entry) =>
      into(cachedUstazes).insert(entry);

  Future<void> upsert(CachedUstazesCompanion entry) =>
      into(cachedUstazes).insertOnConflictUpdate(entry);

  Future<void> deactivateNotIn(Set<int> activeIds) async {
    final query = update(cachedUstazes);
    if (activeIds.isNotEmpty) {
      query.where((t) => t.id.isNotIn(activeIds));
    }
    await query.write(const CachedUstazesCompanion(isActive: Value(false)));
  }

  Future<bool> updateEntry(CachedUstaze entry) =>
      update(cachedUstazes).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(cachedUstazes)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(cachedUstazes).go();

  Future<void> reorder(List<int> orderedIds) async {
    await batch((b) {
      for (var i = 0; i < orderedIds.length; i++) {
        b.update(
          cachedUstazes,
          CachedUstazesCompanion(sortOrder: Value(i)),
          where: (t) => t.id.equals(orderedIds[i]),
        );
      }
    });
  }
}
