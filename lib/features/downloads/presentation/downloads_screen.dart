import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/formatters.dart';
import '../../derses/providers/derses_providers.dart';
import '../models/downloaded_ders_item.dart';
import '../providers/download_providers.dart';
import '../services/ders_download_service.dart';

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(downloadedDersesProvider);
    final totalBytesAsync = ref.watch(totalDownloadsBytesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
        actions: [
          IconButton(
            tooltip: 'Clear all downloads',
            onPressed: () => _confirmClearAll(context, ref),
            icon: const Icon(Icons.delete_sweep_outlined),
          ),
        ],
      ),
      body: itemsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Could not load downloads')),
        data: (items) {
          final totalBytes = totalBytesAsync.maybeWhen(
            data: (value) => value,
            orElse: () => 0,
          );

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(downloadedDersesProvider);
              ref.invalidate(totalDownloadsBytesProvider);
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: _StorageSummary(
                    totalBytes: totalBytes,
                    dersCount: items.length,
                  ),
                ),
                if (items.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download_outlined, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No downloads yet'),
                        ],
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    sliver: SliverList.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return _DownloadedDersTile(
                          item: items[index],
                          onDelete: () => _deleteDers(context, ref, items[index]),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteDers(
    BuildContext context,
    WidgetRef ref,
    DownloadedDersItem item,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete download?'),
        content: Text(
          'Remove offline files for "${item.ders.title}"? This frees ${formatBytes(item.bytesUsed)}.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await ref.read(dersDownloadServiceProvider).deleteDersDownloads(item.ders.id);
    ref.invalidate(downloadedDersesProvider);
    ref.invalidate(totalDownloadsBytesProvider);
    ref.invalidate(dersDownloadStatusProvider(item.ders.id));
    ref.invalidate(isDersFullyDownloadedProvider(item.ders.id));

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted "${item.ders.title}"')),
    );
  }

  Future<void> _confirmClearAll(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear all downloads?'),
        content: const Text(
          'This permanently deletes all offline PDFs and episode audio files.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear all'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await ref.read(dersDownloadServiceProvider).clearAllDownloads();
    ref.invalidate(downloadedDersesProvider);
    ref.invalidate(totalDownloadsBytesProvider);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All downloads cleared')),
    );
  }
}

class _StorageSummary extends StatelessWidget {
  const _StorageSummary({
    required this.totalBytes,
    required this.dersCount,
  });

  final int totalBytes;
  final int dersCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.storage_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total storage used',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${formatBytes(totalBytes)} across $dersCount ders${dersCount == 1 ? '' : 'es'}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DownloadedDersTile extends StatelessWidget {
  const _DownloadedDersTile({
    required this.item,
    required this.onDelete,
  });

  final DownloadedDersItem item;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
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
        subtitle: Text(
          '${item.episodeCount} episode${item.episodeCount == 1 ? '' : 's'}'
          '${item.hasPdf ? ' · PDF' : ''} · ${formatBytes(item.bytesUsed)}',
        ),
        trailing: IconButton(
          tooltip: 'Delete download',
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}
