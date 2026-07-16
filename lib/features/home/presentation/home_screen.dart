import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/widgets/app_empty_state.dart';
import '../../../core/widgets/app_error_state.dart';
import '../../../core/widgets/app_list_skeleton.dart';
import '../../content/providers/content_sync_provider.dart';
import '../models/home_models.dart';
import '../providers/home_providers.dart';
import 'widgets/browse_mode_toggle.dart';
import 'widgets/continue_listening_row.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/sync_error_banner.dart';
import 'widgets/syncing_banner.dart';
import 'widgets/topic_card.dart';
import 'widgets/ustaz_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await ref.read(contentSyncProvider.notifier).sync();
    invalidateContentCaches(ref.invalidate);
    ref.invalidate(continueListeningProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(contentSyncBootstrapProvider);

    final syncState = ref.watch(contentSyncProvider);
    final browseModeAsync = ref.watch(homeBrowseModeProvider);
    final continueAsync = ref.watch(continueListeningProvider);
    final matchingDersesAsync = ref.watch(matchingDersesProvider);
    final searchQuery = ref.watch(homeSearchQueryProvider);

    final browseMode = browseModeAsync.maybeWhen(
      data: (mode) => mode,
      orElse: () => HomeBrowseMode.ustaz,
    );

    final bannerHeight = syncState.isSyncing
        ? 28.0
        : (syncState.hasError ? 56.0 : 0.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottom: bannerHeight > 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(bannerHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (syncState.isSyncing) const SyncingBanner(),
                    if (!syncState.isSyncing && syncState.lastError != null)
                      SyncErrorBanner(
                        message: syncState.lastError!,
                        onRetry: () =>
                            ref.read(contentSyncProvider.notifier).sync(),
                      ),
                  ],
                ),
              )
            : null,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HomeSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  ref.read(homeSearchQueryProvider.notifier).state = value;
                  setState(() {});
                },
                onClear: () {
                  _searchController.clear();
                  ref.read(homeSearchQueryProvider.notifier).state = '';
                  setState(() {});
                },
              ),
            ),
            SliverToBoxAdapter(
              child: continueAsync.when(
                data: (items) => ContinueListeningRow(items: items),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            SliverToBoxAdapter(
              child: BrowseModeToggle(
                mode: browseMode,
                onChanged: (mode) =>
                    ref.read(homeBrowseModeProvider.notifier).setMode(mode),
              ),
            ),
            if (searchQuery.trim().isNotEmpty)
              matchingDersesAsync.when(
                data: (derses) {
                  if (derses.isEmpty) {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                  return SliverList.builder(
                    itemCount: derses.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            'Matching Derses',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        );
                      }
                      final ders = derses[index - 1];
                      return ListTile(
                        leading: const Icon(Icons.menu_book_outlined),
                        title: Text(ders.title),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context.push(AppRoutes.dersEpisodesPath(ders.id)),
                      );
                    },
                  );
                },
                loading: () => const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: LinearProgressIndicator(),
                  ),
                ),
                error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
              ),
            if (browseMode == HomeBrowseMode.ustaz)
              const _UstazGrid()
            else
              const _TopicGrid(),
          ],
        ),
      ),
    );
  }
}

class _UstazGrid extends ConsumerWidget {
  const _UstazGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ustazesAsync = ref.watch(filteredUstazesProvider);
    final countsAsync = ref.watch(dersCountByUstazProvider);
    final searchQuery = ref.watch(homeSearchQueryProvider).trim();
    final matchingDerses = ref.watch(matchingDersesProvider).maybeWhen(
          data: (value) => value,
          orElse: () => const [],
        );
    final syncError = ref.watch(contentSyncProvider).lastError;

    return ustazesAsync.when(
      loading: () => const AppSliverGridSkeleton(),
      error: (_, __) => SliverFillRemaining(
        hasScrollBody: false,
        child: AppErrorState(
          title: 'Could not load ustazes',
          message: 'Something went wrong reading local content.',
          onRetry: () {
            invalidateContentCaches(ref.invalidate);
            ref.invalidate(filteredUstazesProvider);
          },
        ),
      ),
      data: (ustazes) {
        if (ustazes.isEmpty) {
          if (searchQuery.isNotEmpty) {
            if (matchingDerses.isNotEmpty) {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: AppEmptyState(
                icon: Icons.search_off,
                title: 'No search results',
                message: 'Try a different ustaz name or ders title.',
              ),
            );
          }

          return SliverFillRemaining(
            hasScrollBody: false,
            child: AppEmptyState(
              icon: Icons.person_outline,
              title: syncError != null ? 'No content yet' : 'No ustazes yet',
              message: syncError != null
                  ? 'Connect to the internet and retry to download the catalog.'
                  : 'Pull down to refresh when you are online.',
              actionLabel: syncError != null ? 'Retry sync' : null,
              onAction: syncError != null
                  ? () => ref.read(contentSyncProvider.notifier).sync()
                  : null,
            ),
          );
        }

        final counts = countsAsync.maybeWhen(
          data: (value) => value,
          orElse: () => const <int, int>{},
        );

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final ustaz = ustazes[index];
                return UstazCard(
                  ustaz: ustaz,
                  dersCount: counts[ustaz.id] ?? 0,
                  onTap: () => context.push(AppRoutes.ustazDersesPath(ustaz.id)),
                );
              },
              childCount: ustazes.length,
            ),
          ),
        );
      },
    );
  }
}

class _TopicGrid extends ConsumerWidget {
  const _TopicGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(filteredTopicsProvider);
    final countsAsync = ref.watch(dersCountByTopicProvider);
    final searchQuery = ref.watch(homeSearchQueryProvider).trim();
    final matchingDerses = ref.watch(matchingDersesProvider).maybeWhen(
          data: (value) => value,
          orElse: () => const [],
        );
    final syncError = ref.watch(contentSyncProvider).lastError;

    return topicsAsync.when(
      loading: () => const AppSliverGridSkeleton(),
      error: (_, __) => SliverFillRemaining(
        hasScrollBody: false,
        child: AppErrorState(
          title: 'Could not load topics',
          message: 'Something went wrong reading local content.',
          onRetry: () {
            invalidateContentCaches(ref.invalidate);
            ref.invalidate(filteredTopicsProvider);
          },
        ),
      ),
      data: (topics) {
        if (topics.isEmpty) {
          if (searchQuery.isNotEmpty) {
            if (matchingDerses.isNotEmpty) {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: AppEmptyState(
                icon: Icons.search_off,
                title: 'No search results',
                message: 'Try a different topic name or ders title.',
              ),
            );
          }

          return SliverFillRemaining(
            hasScrollBody: false,
            child: AppEmptyState(
              icon: Icons.topic_outlined,
              title: syncError != null ? 'No content yet' : 'No topics yet',
              message: syncError != null
                  ? 'Connect to the internet and retry to download the catalog.'
                  : 'Pull down to refresh when you are online.',
              actionLabel: syncError != null ? 'Retry sync' : null,
              onAction: syncError != null
                  ? () => ref.read(contentSyncProvider.notifier).sync()
                  : null,
            ),
          );
        }

        final counts = countsAsync.maybeWhen(
          data: (value) => value,
          orElse: () => const <int, int>{},
        );

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final topic = topics[index];
                return TopicCard(
                  topic: topic,
                  dersCount: counts[topic.id] ?? 0,
                  onTap: () => context.push(AppRoutes.topicDersesPath(topic.id)),
                );
              },
              childCount: topics.length,
            ),
          ),
        );
      },
    );
  }
}
