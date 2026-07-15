import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/formatters.dart';
import '../../derses/models/derses_models.dart';
import '../../derses/providers/derses_providers.dart';
import '../../derses/services/ders_download_service.dart';

class EpisodesListScreen extends ConsumerWidget {
  const EpisodesListScreen({super.key, required this.dersId});

  final int dersId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dersAsync = ref.watch(dersDetailProvider(dersId));
    final episodesAsync = ref.watch(episodesWithProgressProvider(dersId));
    final isFullyDownloadedAsync = ref.watch(isDersFullyDownloadedProvider(dersId));

    final dersTitle = dersAsync.maybeWhen(
      data: (ders) => ders?.title ?? 'Episodes',
      orElse: () => 'Episodes',
    );

    final isFullyDownloaded = isFullyDownloadedAsync.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(title: Text(dersTitle)),
      body: episodesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Could not load episodes')),
        data: (episodes) {
          if (episodes.isEmpty) {
            return const Center(child: Text('No episodes found'));
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            itemCount: episodes.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = episodes[index];
              return _EpisodeTile(item: item);
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: isFullyDownloaded
                ? null
                : () => _downloadDers(context, ref),
            icon: Icon(isFullyDownloaded ? Icons.download_done : Icons.download),
            label: Text(
              isFullyDownloaded ? 'Downloaded' : 'Download this Ders',
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _downloadDers(BuildContext context, WidgetRef ref) async {
    final service = ref.read(dersDownloadServiceProvider);
    final queued = await service.downloadDers(dersId);

    ref.invalidate(dersDownloadStatusProvider(dersId));
    ref.invalidate(isDersFullyDownloadedProvider(dersId));
    ref.invalidate(episodesWithProgressProvider(dersId));

    if (!context.mounted) return;

    final message = queued > 0
        ? 'Downloaded $queued episode${queued == 1 ? '' : 's'}'
        : 'All episodes already downloaded';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class _EpisodeTile extends StatelessWidget {
  const _EpisodeTile({required this.item});

  final EpisodeWithProgress item;

  @override
  Widget build(BuildContext context) {
    final episode = item.episode;

    return Card(
      child: ListTile(
        onTap: () => context.push(AppRoutes.playerEpisodePath(episode.id)),
        title: Text(episode.title),
        subtitle: Text(
          '${formatDuration(episode.durationSeconds)} · ${formatPageRange(episode.startPage, episode.endPage)}',
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.play_arrow),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.isCompleted)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
