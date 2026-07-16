import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_list_skeleton.dart';
import '../../content/providers/content_sync_provider.dart';
import 'widgets/ders_list_tile.dart';

class DersesScreen extends ConsumerWidget {
  const DersesScreen({super.key});

  Future<void> _refresh(WidgetRef ref) async {
    await ref.read(contentSyncProvider.notifier).sync();
    invalidateContentCaches(ref.invalidate);
  }

  void _retry(WidgetRef ref) {
    ref.invalidate(publishedDersesProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dersesAsync = ref.watch(publishedDersesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Derses')),
      body: RefreshIndicator(
        onRefresh: () => _refresh(ref),
        child: dersesAsync.when(
          loading: () => const AppListSkeleton(),
          error: (_, __) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: AppErrorState(
                  title: 'Could not load derses',
                  message: 'Something went wrong reading local content.',
                  onRetry: () => _retry(ref),
                ),
              ),
            ],
          ),
          data: (derses) {
            if (derses.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: AppEmptyState(
                      icon: Icons.menu_book_outlined,
                      title: 'No derses found',
                      message:
                          'Pull down to refresh, or check back after syncing.',
                      actionLabel: 'Retry sync',
                      onAction: () => _refresh(ref),
                    ),
                  ),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: derses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return DersListTile(ders: derses[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
