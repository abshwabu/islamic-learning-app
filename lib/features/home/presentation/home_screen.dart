import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../content/providers/content_sync_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(contentSyncBootstrapProvider);
    final syncState = ref.watch(contentSyncProvider);
    final ustazesAsync = ref.watch(activeUstazesProvider);
    final topicsAsync = ref.watch(activeTopicsProvider);
    final dersesAsync = ref.watch(publishedDersesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottom: syncState.isSyncing
            ? const PreferredSize(
                preferredSize: Size.fromHeight(28),
                child: _SyncingBanner(),
              )
            : null,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(contentSyncProvider.notifier).sync(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Icon(
              Icons.mosque_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Islamic Learning',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Discover and listen to derses',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 24),
            _SummaryCard(
              title: 'Ustazes',
              count: ustazesAsync.maybeWhen(
                data: (items) => items.length,
                orElse: () => null,
              ),
            ),
            const SizedBox(height: 12),
            _SummaryCard(
              title: 'Topics',
              count: topicsAsync.maybeWhen(
                data: (items) => items.length,
                orElse: () => null,
              ),
            ),
            const SizedBox(height: 12),
            _SummaryCard(
              title: 'Derses',
              count: dersesAsync.maybeWhen(
                data: (items) => items.length,
                orElse: () => null,
              ),
            ),
            if (syncState.lastSyncedAt != null) ...[
              const SizedBox(height: 24),
              Text(
                'Last synced ${_formatSyncTime(syncState.lastSyncedAt!)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatSyncTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

class _SyncingBanner extends StatelessWidget {
  const _SyncingBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Syncing...',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.count,
  });

  final String title;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: count != null
            ? Text(
                '$count',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
              )
            : const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
      ),
    );
  }
}
