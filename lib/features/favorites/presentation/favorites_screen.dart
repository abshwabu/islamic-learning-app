import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/formatters.dart';
import '../models/favorite_entity_type.dart';
import '../models/favorite_items.dart';
import '../providers/favorites_providers.dart';
import 'widgets/favorite_star_button.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dersesAsync = ref.watch(favoriteDersesProvider);
    final episodesAsync = ref.watch(favoriteEpisodesProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Derses'),
              Tab(text: 'Episodes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            dersesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: Text('Could not load favorite derses')),
              data: (items) => _FavoriteDersesList(items: items),
            ),
            episodesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: Text('Could not load favorite episodes')),
              data: (items) => _FavoriteEpisodesList(items: items),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteDersesList extends StatelessWidget {
  const _FavoriteDersesList({required this.items});

  final List<FavoriteDersItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _EmptyFavorites(
        icon: Icons.star_border,
        message: 'No favorite derses yet',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: ListTile(
            onTap: () => context.push(AppRoutes.dersEpisodesPath(item.ders.id)),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 48,
                height: 48,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: item.ders.coverImageUrl != null
                    ? Image.network(
                        item.ders.coverImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.menu_book_outlined),
                      )
                    : const Icon(Icons.menu_book_outlined),
              ),
            ),
            title: Text(item.ders.title),
            subtitle: item.ders.description != null
                ? Text(
                    item.ders.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            trailing: FavoriteStarButton(
              entityType: FavoriteEntityType.ders,
              entityId: item.ders.id,
            ),
          ),
        );
      },
    );
  }
}

class _FavoriteEpisodesList extends StatelessWidget {
  const _FavoriteEpisodesList({required this.items});

  final List<FavoriteEpisodeItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _EmptyFavorites(
        icon: Icons.star_border,
        message: 'No favorite episodes yet',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: ListTile(
            onTap: () =>
                context.push(AppRoutes.playerEpisodePath(item.episode.id)),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.play_arrow),
            ),
            title: Text(item.episode.title),
            subtitle: Text(
              '${item.ders.title} · ${formatDuration(item.episode.durationSeconds)}',
            ),
            trailing: FavoriteStarButton(
              entityType: FavoriteEntityType.episode,
              entityId: item.episode.id,
            ),
          ),
        );
      },
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites({
    required this.icon,
    required this.message,
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(message),
        ],
      ),
    );
  }
}
