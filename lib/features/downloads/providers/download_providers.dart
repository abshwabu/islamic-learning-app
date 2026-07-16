import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/download_models.dart';
import '../models/downloaded_ders_item.dart';
import '../services/ders_download_service.dart';
import 'wifi_only_provider.dart';

final dersDownloadProgressProvider =
    StateNotifierProvider.family<DersDownloadProgressNotifier, DersDownloadProgress?, int>(
  (ref, dersId) => DersDownloadProgressNotifier(ref, dersId),
);

class DersDownloadProgressNotifier extends StateNotifier<DersDownloadProgress?> {
  DersDownloadProgressNotifier(this._ref, this.dersId) : super(null);

  final Ref _ref;
  final int dersId;

  bool get isRunning => state?.isRunning ?? false;

  Future<void> start() async {
    if (isRunning) return;

    final wifiOnly =
        await _ref.read(wifiOnlyDownloadProvider.future);
    final service = _ref.read(dersDownloadServiceProvider);

    state = DersDownloadProgress(dersId: dersId, isRunning: true);

    try {
      await service.downloadDers(
        dersId: dersId,
        wifiOnly: wifiOnly,
        onProgress: (progress) {
          if (!mounted) return;
          state = progress;
        },
      );
    } on Object catch (error) {
      if (!mounted) return;
      state = (state ?? DersDownloadProgress(dersId: dersId)).copyWith(
        isRunning: false,
        errorMessage: error.toString(),
      );
      rethrow;
    }
  }

  void cancel() {
    _ref.read(dersDownloadServiceProvider).cancel(dersId);
    if (state != null) {
      state = state!.copyWith(isRunning: false);
    }
  }
}

final downloadedDersesProvider =
    FutureProvider<List<DownloadedDersItem>>((ref) async {
  return ref.watch(dersDownloadServiceProvider).listDownloadedDerses();
});

final totalDownloadsBytesProvider = FutureProvider<int>((ref) async {
  return ref.watch(dersDownloadServiceProvider).totalStorageUsed();
});
