import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/favorites.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  Future<List<Favorite>> getAll() => select(favorites).get();

  Future<Favorite?> getById(int id) =>
      (select(favorites)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<Favorite?> getByEntity(String entityType, int entityId) =>
      (select(favorites)
            ..where(
              (t) => t.entityType.equals(entityType) & t.entityId.equals(entityId),
            ))
          .getSingleOrNull();

  Future<int> insert(FavoritesCompanion entry) => into(favorites).insert(entry);

  Future<bool> updateEntry(Favorite entry) => update(favorites).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(favorites)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(favorites).go();
}
