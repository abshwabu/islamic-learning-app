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

  Future<int> insert(DownloadsCompanion entry) => into(downloads).insert(entry);

  Future<bool> updateEntry(Download entry) => update(downloads).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(downloads)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(downloads).go();
}
