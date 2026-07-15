import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/downloads.dart';

part 'downloads_dao.g.dart';

@DriftAccessor(tables: [Downloads])
class DownloadsDao extends DatabaseAccessor<AppDatabase>
    with _$DownloadsDaoMixin {
  DownloadsDao(super.db);

  Future<List<Download>> getAll() => select(downloads).get();

  Future<Download?> getById(int id) =>
      (select(downloads)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<Download?> getByEpisodeId(int episodeId) =>
      (select(downloads)..where((t) => t.episodeId.equals(episodeId)))
          .getSingleOrNull();

  Future<Set<int>> getDownloadedEpisodeIds(Set<int> episodeIds) async {
    if (episodeIds.isEmpty) return {};
    final rows = await (select(downloads)
          ..where(
            (t) =>
                t.episodeId.isIn(episodeIds) & t.status.equals('completed'),
          ))
        .get();
    return rows.map((row) => row.episodeId).toSet();
  }

  Future<List<Download>> getByEpisodeIds(Set<int> episodeIds) async {
    if (episodeIds.isEmpty) return [];
    return (select(downloads)..where((t) => t.episodeId.isIn(episodeIds))).get();
  }

  Future<int> insert(DownloadsCompanion entry) => into(downloads).insert(entry);

  Future<bool> updateEntry(Download entry) => update(downloads).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(downloads)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(downloads).go();
}
