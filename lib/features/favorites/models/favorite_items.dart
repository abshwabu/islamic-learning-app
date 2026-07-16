import '../../../core/database/database.dart';

class FavoriteDersItem {
  const FavoriteDersItem({
    required this.favorite,
    required this.ders,
  });

  final Favorite favorite;
  final CachedDers ders;
}

class FavoriteEpisodeItem {
  const FavoriteEpisodeItem({
    required this.favorite,
    required this.episode,
    required this.ders,
  });

  final Favorite favorite;
  final CachedEpisode episode;
  final CachedDers ders;
}
