import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import '../../providers/favorites_providers.dart';

class FavoriteStarButton extends ConsumerWidget {
  const FavoriteStarButton({
    super.key,
    required this.entityType,
    required this.entityId,
    this.tooltipFavorited = 'Remove from favorites',
    this.tooltipUnfavorited = 'Add to favorites',
  });

  final String entityType;
  final int entityId;
  final String tooltipFavorited;
  final String tooltipUnfavorited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteAsync = ref.watch(
      isFavoriteProvider((type: entityType, id: entityId)),
    );
    final isFavorite = favoriteAsync.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );

    return IconButton(
      tooltip: isFavorite ? tooltipFavorited : tooltipUnfavorited,
      onPressed: () async {
        final added = await ref.read(databaseProvider).favoritesDao.toggle(
              entityType,
              entityId,
            );
        ref.invalidate(favoriteDersesProvider);
        ref.invalidate(favoriteEpisodesProvider);

        if (!context.mounted) return;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              added ? 'Added to favorites' : 'Removed from favorites',
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: isFavorite ? Colors.amber.shade700 : null,
      ),
    );
  }
}
