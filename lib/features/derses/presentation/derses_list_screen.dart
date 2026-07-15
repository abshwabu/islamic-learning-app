import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/database.dart';
import '../../../../core/router/app_router.dart';
import '../models/derses_models.dart';
import '../providers/derses_providers.dart';
import 'widgets/download_status_badge.dart';

enum DersesFilterType { ustaz, topic }

class DersesListScreen extends ConsumerWidget {
  const DersesListScreen({
    super.key,
    required this.filterType,
    required this.filterId,
  });

  final DersesFilterType filterType;
  final int filterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dersesAsync = filterType == DersesFilterType.ustaz
        ? ref.watch(dersesByUstazProvider(filterId))
        : ref.watch(dersesByTopicProvider(filterId));

    final titleAsync = filterType == DersesFilterType.ustaz
        ? ref.watch(ustazNameProvider(filterId))
        : ref.watch(topicNameProvider(filterId));

    final title = titleAsync.maybeWhen(
      data: (name) => name ?? 'Derses',
      orElse: () => 'Derses',
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: dersesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Could not load derses')),
        data: (derses) {
          if (derses.isEmpty) {
            return const Center(child: Text('No derses found'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: derses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _DersListTile(ders: derses[index]);
            },
          );
        },
      ),
    );
  }
}

class _DersListTile extends ConsumerWidget {
  const _DersListTile({required this.ders});

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
            ? Image.network(
                url!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.menu_book_outlined),
              )
            : const Icon(Icons.menu_book_outlined),
      ),
    );
  }
}
