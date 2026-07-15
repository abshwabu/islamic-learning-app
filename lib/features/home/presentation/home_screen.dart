import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../content/providers/content_sync_provider.dart';
import '../models/home_models.dart';
import '../providers/home_providers.dart';
import 'widgets/browse_mode_toggle.dart';
import 'widgets/continue_listening_row.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/matching_derses_section.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottom: syncState.isSyncing
            ? const PreferredSize(
                preferredSize: Size.fromHeight(28),
                child: SyncingBanner(),
              )
            : null,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(contentSyncProvider.notifier).sync(),
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
              SliverToBoxAdapter(
                child: matchingDersesAsync.when(
                  data: (derses) => MatchingDersesSection(derses: derses),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),
            if (browseMode == HomeBrowseMode.ustaz)
              _UstazGrid()
            else
              _TopicGrid(),
          ],
        ),
      ),
    );
  }
}

class _UstazGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ustazesAsync = ref.watch(filteredUstazesProvider);
    final countsAsync = ref.watch(dersCountByUstazProvider);

    return ustazesAsync.when(
      loading: () => const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SliverFillRemaining(
        child: Center(child: Text('Could not load ustazes')),
      ),
      data: (ustazes) {
        if (ustazes.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text('No ustazes found')),
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(filteredTopicsProvider);
    final countsAsync = ref.watch(dersCountByTopicProvider);

    return topicsAsync.when(
      loading: () => const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SliverFillRemaining(
        child: Center(child: Text('Could not load topics')),
      ),
      data: (topics) {
        if (topics.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text('No topics found')),
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
