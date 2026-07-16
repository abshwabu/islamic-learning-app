import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_error_state.dart';
import '../../../core/widgets/app_list_skeleton.dart';
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
              loading: () => const AppListSkeleton(),
              error: (_, __) => AppErrorState(
                title: 'Could not load favorite derses',
                onRetry: () => ref.invalidate(favoriteDersesProvider),
              ),
              data: (items) => _FavoriteDersesList(
                items: items,
                onRefresh: () async {
                  ref.invalidate(favoriteDersesProvider);
                  await ref.read(favoriteDersesProvider.future);
                },
              ),
            ),
            episodesAsync.when(
              loading: () => const AppListSkeleton(),
              error: (_, __) => AppErrorState(
                title: 'Could not load favorite episodes',
                onRetry: () => ref.invalidate(favoriteEpisodesProvider),
              ),
              data: (items) => _FavoriteEpisodesList(
                items: items,
                onRefresh: () async {
                  ref.invalidate(favoriteEpisodesProvider);
                  await ref.read(favoriteEpisodesProvider.future);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteDersesList extends StatelessWidget {
  const _FavoriteDersesList({
    required this.items,
    required this.onRefresh,
  });

  final List<FavoriteDersItem> items;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(
              height: 420,
              child: AppEmptyState(
                icon: Icons.star_border,
                title: 'No favorite derses yet',
                message: 'Tap the star on a ders to save it here.',
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
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
                      ? CachedNetworkImage(
                          imageUrl: item.ders.coverImageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 1.5),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
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
      ),
    );
  }
}

class _FavoriteEpisodesList extends StatelessWidget {
  const _FavoriteEpisodesList({
    required this.items,
    required this.onRefresh,
  });

  final List<FavoriteEpisodeItem> items;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(
              height: 420,
              child: AppEmptyState(
                icon: Icons.star_border,
                title: 'No favorite episodes yet',
                message: 'Tap the star on an episode to save it here.',
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
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
      ),
    );
  }
}
