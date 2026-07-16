import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/favorites.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  Future<List<Favorite>> getAll() => (select(favorites)
        ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
      .get();

  Future<List<Favorite>> getByType(String entityType) =>
      (select(favorites)
            ..where((t) => t.entityType.equals(entityType))
            ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
          .get();

  Stream<List<Favorite>> watchAll() => (select(favorites)
        ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
      .watch();

  Stream<bool> watchIsFavorite(String entityType, int entityId) {
    return (select(favorites)
          ..where(
            (t) => t.entityType.equals(entityType) & t.entityId.equals(entityId),
          ))
        .watch()
        .map((rows) => rows.isNotEmpty);
  }

  Future<Favorite?> getById(int id) =>
      (select(favorites)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<Favorite?> getByEntity(String entityType, int entityId) =>
      (select(favorites)
            ..where(
              (t) => t.entityType.equals(entityType) & t.entityId.equals(entityId),
            ))
          .getSingleOrNull();

  Future<bool> isFavorite(String entityType, int entityId) async {
    return (await getByEntity(entityType, entityId)) != null;
  }

  Future<bool> toggle(String entityType, int entityId) async {
    final existing = await getByEntity(entityType, entityId);
    if (existing != null) {
      await deleteById(existing.id);
      return false;
    }

    await into(favorites).insert(
      FavoritesCompanion.insert(
        entityType: entityType,
        entityId: entityId,
      ),
    );
    return true;
  }

  Future<int> insert(FavoritesCompanion entry) => into(favorites).insert(entry);

  Future<bool> updateEntry(Favorite entry) => update(favorites).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(favorites)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(favorites).go();
}
