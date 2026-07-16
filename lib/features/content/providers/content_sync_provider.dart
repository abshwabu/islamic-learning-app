import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/repositories/content_repository.dart';

class ContentSyncState {
  const ContentSyncState({
    this.isSyncing = false,
    this.lastSyncedAt,
    this.lastError,
  });

  final bool isSyncing;
  final DateTime? lastSyncedAt;
  final String? lastError;

  bool get hasError => lastError != null;

  ContentSyncState copyWith({
    bool? isSyncing,
    DateTime? lastSyncedAt,
    String? lastError,
    bool clearError = false,
  }) {
    return ContentSyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      lastError: clearError ? null : (lastError ?? this.lastError),
    );
  }
}

final contentSyncProvider =
    StateNotifierProvider<ContentSyncNotifier, ContentSyncState>((ref) {
  final notifier = ContentSyncNotifier(ref);
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
  ContentSyncNotifier(this._ref) : super(const ContentSyncState());

  final Ref _ref;
  Timer? _timer;

  ContentRepository get _repository => _ref.read(contentRepositoryProvider);

  Future<void> sync() async {
    if (state.isSyncing) return;

    state = state.copyWith(isSyncing: true, clearError: true);
    try {
      await _repository.syncContent();
      if (!mounted) return;
      state = state.copyWith(
        isSyncing: false,
        lastSyncedAt: DateTime.now(),
        clearError: true,
      );
      invalidateContentCaches(_ref.invalidate);
    } on Object catch (error) {
      // Keep the app usable offline / on first launch with an empty cache.
      if (!mounted) return;
      state = state.copyWith(
        isSyncing: false,
        lastError: _friendlySyncError(error),
      );
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

/// Refresh Drift-backed content providers after a successful sync.
void invalidateContentCaches(void Function(ProviderOrFamily) invalidate) {
  invalidate(activeUstazesProvider);
  invalidate(activeTopicsProvider);
  invalidate(publishedDersesProvider);
}

String _friendlySyncError(Object error) {
  final text = error.toString();
  if (text.contains('SocketException') ||
      text.contains('Failed host lookup') ||
      text.contains('Network is unreachable') ||
      text.contains('Connection refused')) {
    return 'Unable to reach the server. Check your connection and try again.';
  }
  if (text.contains('TimeoutException') || text.contains('timed out')) {
    return 'The server took too long to respond. Try again.';
  }
  return 'Could not sync content. Pull to refresh or retry.';
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
