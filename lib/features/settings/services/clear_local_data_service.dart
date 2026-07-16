import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../downloads/providers/download_providers.dart';
import '../../downloads/services/ders_download_service.dart';
import '../../home/providers/home_providers.dart';

final clearLocalDataServiceProvider = Provider<ClearLocalDataService>((ref) {
  return ClearLocalDataService(
    db: ref.watch(databaseProvider),
    downloads: ref.watch(dersDownloadServiceProvider),
  );
});

class ClearLocalDataService {
  ClearLocalDataService({
    required AppDatabase db,
    required DersDownloadService downloads,
  })  : _db = db,
        _downloads = downloads;

  final AppDatabase _db;
  final DersDownloadService _downloads;

  /// Clears progress, favorites, and downloads (including offline files).
  /// Cached content and app settings are preserved.
  Future<void> clearUserData() async {
    await _downloads.clearAllDownloads();
    await _db.progressDao.deleteAll();
    await _db.favoritesDao.deleteAll();
  }
}

void invalidateAfterClearLocalData(WidgetRef ref) {
  ref.invalidate(downloadedDersesProvider);
  ref.invalidate(totalDownloadsBytesProvider);
  ref.invalidate(continueListeningProvider);
}
