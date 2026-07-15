import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/repositories/content_repository.dart';

class ContentSyncState {
  const ContentSyncState({
    this.isSyncing = false,
    this.lastSyncedAt,
  });

  final bool isSyncing;
  final DateTime? lastSyncedAt;

  ContentSyncState copyWith({
    bool? isSyncing,
    DateTime? lastSyncedAt,
  }) {
    return ContentSyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }
}

final contentSyncProvider =
    StateNotifierProvider<ContentSyncNotifier, ContentSyncState>((ref) {
  final notifier = ContentSyncNotifier(ref.watch(contentRepositoryProvider));
  ref.onDispose(notifier.cancelTimer);
  return notifier;
});

/// Triggers initial and periodic content sync. Watch from a top-level screen.
final contentSyncBootstrapProvider = Provider<void>((ref) {
  final notifier = ref.watch(contentSyncProvider.notifier);
  Future.microtask(notifier.sync);
  notifier.startPeriodicSync(ApiConstants.contentSyncInterval);
});

class ContentSyncNotifier extends StateNotifier<ContentSyncState> {
  ContentSyncNotifier(this._repository) : super(const ContentSyncState());

  final ContentRepository _repository;
  Timer? _timer;

  Future<void> sync() async {
    if (state.isSyncing) return;

    state = state.copyWith(isSyncing: true);
    try {
      await _repository.syncContent();
      if (!mounted) return;
      state = state.copyWith(
        isSyncing: false,
        lastSyncedAt: DateTime.now(),
      );
    } on Object {
      if (!mounted) return;
      state = state.copyWith(isSyncing: false);
    }
  }

  void startPeriodicSync(Duration interval) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => sync());
  }

  void cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}

final activeUstazesProvider = FutureProvider((ref) {
  return ref.watch(databaseProvider).cachedUstazesDao.getActive();
});

final activeTopicsProvider = FutureProvider((ref) {
  return ref.watch(databaseProvider).cachedTopicsDao.getActive();
});

final publishedDersesProvider = FutureProvider((ref) {
  return ref.watch(databaseProvider).cachedDersesDao.getPublished();
});
