import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_list_skeleton.dart';
import '../../content/providers/content_sync_provider.dart';
import '../providers/derses_providers.dart';
import 'widgets/ders_list_tile.dart';

enum DersesFilterType { ustaz, topic }

class DersesListScreen extends ConsumerWidget {
  const DersesListScreen({
    super.key,
    required this.filterType,
    required this.filterId,
  });

  final DersesFilterType filterType;
  final int filterId;

  Future<void> _refresh(WidgetRef ref) async {
    await ref.read(contentSyncProvider.notifier).sync();
    invalidateContentCaches(ref.invalidate);
    if (filterType == DersesFilterType.ustaz) {
      ref.invalidate(dersesByUstazProvider(filterId));
      ref.invalidate(ustazNameProvider(filterId));
    } else {
      ref.invalidate(dersesByTopicProvider(filterId));
      ref.invalidate(topicNameProvider(filterId));
    }
  }

  void _retry(WidgetRef ref) {
    if (filterType == DersesFilterType.ustaz) {
      ref.invalidate(dersesByUstazProvider(filterId));
    } else {
      ref.invalidate(dersesByTopicProvider(filterId));
    }
  }

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
