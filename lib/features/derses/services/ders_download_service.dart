import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';

final dersDownloadServiceProvider = Provider<DersDownloadService>((ref) {
  return DersDownloadService(ref.watch(databaseProvider));
});

class DersDownloadService {
  DersDownloadService(this._db);

  final AppDatabase _db;

  Future<int> downloadDers(int dersId) async {
    final episodes = await _db.cachedEpisodesDao.getPublishedByDersId(dersId);
    var queued = 0;

    for (final episode in episodes) {
      final existing = await _db.downloadsDao.getByEpisodeId(episode.id);
      if (existing != null) continue;

      await _db.downloadsDao.insert(
        DownloadsCompanion.insert(
          episodeId: episode.id,
          localPath: '/downloads/ders_$dersId/episode_${episode.id}.mp3',
          status: const Value('completed'),
        ),
      );
      queued++;
    }

    return queued;
  }
}
