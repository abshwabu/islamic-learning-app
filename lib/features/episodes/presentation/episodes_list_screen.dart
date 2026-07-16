import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/formatters.dart';
import '../../derses/models/derses_models.dart';
import '../../derses/providers/derses_providers.dart';
import '../../downloads/models/download_models.dart';
import '../../downloads/providers/download_providers.dart';
import '../../downloads/services/ders_download_service.dart';

class EpisodesListScreen extends ConsumerWidget {
  const EpisodesListScreen({super.key, required this.dersId});

  final int dersId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dersAsync = ref.watch(dersDetailProvider(dersId));
    final episodesAsync = ref.watch(episodesWithProgressProvider(dersId));
    final isFullyDownloadedAsync =
        ref.watch(isDersFullyDownloadedProvider(dersId));
    final downloadProgress = ref.watch(dersDownloadProgressProvider(dersId));

    final dersTitle = dersAsync.maybeWhen(
      data: (ders) => ders?.title ?? 'Episodes',
      orElse: () => 'Episodes',
    );

    final isFullyDownloaded = isFullyDownloadedAsync.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );
    final isDownloading = downloadProgress?.isRunning ?? false;

    return Scaffold(
      appBar: AppBar(title: Text(dersTitle)),
      body: Column(
        children: [
          if (downloadProgress != null &&
              (isDownloading || downloadProgress.errorMessage != null))
            _DownloadProgressBanner(
              progress: downloadProgress,
              onCancel: () =>
                  ref.read(dersDownloadProgressProvider(dersId).notifier).cancel(),
            ),
          Expanded(
            child: episodesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: Text('Could not load episodes')),
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
                    final fileProgress = downloadProgress?.files
                        .where((f) => f.episodeId == item.episode.id)
                        .firstOrNull;
                    return _EpisodeTile(
                      item: item,
                      fileProgress: fileProgress,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: isFullyDownloaded || isDownloading
                ? null
                : () => _downloadDers(context, ref),
            icon: Icon(
              isFullyDownloaded
                  ? Icons.download_done
                  : isDownloading
                      ? Icons.downloading
                      : Icons.download,
            ),
            label: Text(
              isFullyDownloaded
                  ? 'Downloaded'
                  : isDownloading
                      ? 'Downloading...'
                      : 'Download this Ders',
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _downloadDers(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(dersDownloadProgressProvider(dersId).notifier);

    try {
      await notifier.start();

      ref.invalidate(dersDownloadStatusProvider(dersId));
      ref.invalidate(isDersFullyDownloadedProvider(dersId));
      ref.invalidate(episodesWithProgressProvider(dersId));
      ref.invalidate(downloadedDersesProvider);
      ref.invalidate(totalDownloadsBytesProvider);

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Download complete')),
      );
    } on WifiRequiredException catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    } on Object catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $error')),
      );
    }
  }
}

class _DownloadProgressBanner extends StatelessWidget {
  const _DownloadProgressBanner({
    required this.progress,
    required this.onCancel,
  });

  final DersDownloadProgress progress;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final current = progress.currentFile;

    return Material(
      color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.4),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    progress.isRunning
                        ? 'Downloading ${progress.completedCount}/${progress.totalCount}'
                        : (progress.errorMessage ?? 'Download paused'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                if (progress.isRunning)
                  TextButton(
                    onPressed: onCancel,
                    child: const Text('Cancel'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress.overallFraction),
            if (current != null) ...[
              const SizedBox(height: 8),
              Text(
                '${current.label} · ${(current.fraction * 100).toStringAsFixed(0)}%'
                '${current.totalBytes > 0 ? ' (${formatBytes(current.receivedBytes)} / ${formatBytes(current.totalBytes)})' : ''}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(value: current.fraction),
            ],
          ],
        ),
      ),
    );
  }
}

class _EpisodeTile extends StatelessWidget {
  const _EpisodeTile({
    required this.item,
    this.fileProgress,
  });

  final EpisodeWithProgress item;
  final DownloadFileProgress? fileProgress;

  @override
  Widget build(BuildContext context) {
    final episode = item.episode;
    final isDownloading =
        fileProgress?.status == DownloadFileStatus.downloading;

    return Card(
      child: ListTile(
        onTap: () => context.push(AppRoutes.playerEpisodePath(episode.id)),
        title: Text(episode.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${formatDuration(episode.durationSeconds)} · ${formatPageRange(episode.startPage, episode.endPage)}',
            ),
            if (isDownloading) ...[
              const SizedBox(height: 6),
              LinearProgressIndicator(value: fileProgress!.fraction),
            ],
          ],
        ),
        isThreeLine: isDownloading,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.play_arrow),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.isDownloaded)
              Icon(
                Icons.download_done,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            if (item.isCompleted) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
