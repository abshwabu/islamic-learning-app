import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../models/favorite_entity_type.dart';
import '../models/favorite_items.dart';

final isFavoriteProvider =
    StreamProvider.family<bool, ({String type, int id})>((ref, key) {
  return ref
      .watch(databaseProvider)
      .favoritesDao
      .watchIsFavorite(key.type, key.id);
});

final favoriteDersesProvider = FutureProvider<List<FavoriteDersItem>>((ref) async {
  final db = ref.watch(databaseProvider);
  final favorites = await db.favoritesDao.getByType(FavoriteEntityType.ders);
  final items = <FavoriteDersItem>[];

  for (final favorite in favorites) {
    final ders = await db.cachedDersesDao.getById(favorite.entityId);
    if (ders == null) continue;
    items.add(FavoriteDersItem(favorite: favorite, ders: ders));
  }

  return items;
});

final favoriteEpisodesProvider =
    FutureProvider<List<FavoriteEpisodeItem>>((ref) async {
  final db = ref.watch(databaseProvider);
  final favorites = await db.favoritesDao.getByType(FavoriteEntityType.episode);
  final items = <FavoriteEpisodeItem>[];

  for (final favorite in favorites) {
    final episode = await db.cachedEpisodesDao.getById(favorite.entityId);
    if (episode == null) continue;
    final ders = await db.cachedDersesDao.getById(episode.dersId);
    if (ders == null) continue;
    items.add(
      FavoriteEpisodeItem(
        favorite: favorite,
        episode: episode,
        ders: ders,
      ),
    );
  }

  return items;
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository(ref.watch(databaseProvider));
});

class FavoritesRepository {
  FavoritesRepository(this._db);

  final AppDatabase _db;

  Future<bool> toggleDers(int dersId) {
    return _db.favoritesDao.toggle(FavoriteEntityType.ders, dersId);
  }

  Future<bool> toggleEpisode(int episodeId) {
    return _db.favoritesDao.toggle(FavoriteEntityType.episode, episodeId);
  }
}
