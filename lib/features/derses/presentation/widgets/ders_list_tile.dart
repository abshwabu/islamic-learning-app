import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/database.dart';
import '../../../../core/router/app_router.dart';
import '../../../favorites/models/favorite_entity_type.dart';
import '../../../favorites/presentation/widgets/favorite_star_button.dart';
import '../../models/derses_models.dart';
import '../../providers/derses_providers.dart';
import 'download_status_badge.dart';

class DersListTile extends ConsumerWidget {
  const DersListTile({super.key, required this.ders});

  final CachedDers ders;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeCountAsync = ref.watch(publishedEpisodeCountProvider(ders.id));
    final downloadStatusAsync = ref.watch(dersDownloadStatusProvider(ders.id));

    final episodeCount = episodeCountAsync.maybeWhen(
      data: (count) => count,
      orElse: () => null,
    );
    final downloadStatus = downloadStatusAsync.maybeWhen(
      data: (status) => status,
      orElse: () => DersDownloadStatus.none,
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(AppRoutes.dersEpisodesPath(ders.id)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _CoverImage(url: ders.coverImageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ders.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      episodeCount != null
                          ? '$episodeCount episodes'
                          : 'Loading...',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              FavoriteStarButton(
                entityType: FavoriteEntityType.ders,
                entityId: ders.id,
              ),
              DownloadStatusBadge(status: downloadStatus),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 64,
        height: 64,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: url != null
            ? CachedNetworkImage(
                imageUrl: url!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.menu_book_outlined),
              )
            : const Icon(Icons.menu_book_outlined),
      ),
    );
  }
}
