import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/downloads.dart';

part 'downloads_dao.g.dart';

@DriftAccessor(tables: [Downloads])
class DownloadsDao extends DatabaseAccessor<AppDatabase>
    with _$DownloadsDaoMixin {
  DownloadsDao(super.db);

  Future<List<Download>> getAll() => select(downloads).get();

  Future<List<Download>> getCompleted() =>
      (select(downloads)..where((t) => t.status.equals('completed'))).get();

  Future<Download?> getById(int id) =>
      (select(downloads)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<Download?> getByEpisodeId(int episodeId) =>
      (select(downloads)
            ..where(
              (t) =>
                  t.entityType.equals('episode') &
                  t.episodeId.equals(episodeId),
            ))
          .getSingleOrNull();

  Future<Download?> getPdfByDersId(int dersId) =>
      (select(downloads)
            ..where(
              (t) => t.entityType.equals('pdf') & t.dersId.equals(dersId),
            ))
          .getSingleOrNull();

  Future<List<Download>> getByDersId(int dersId) =>
      (select(downloads)..where((t) => t.dersId.equals(dersId))).get();

  Future<List<Download>> getCompletedByDersId(int dersId) =>
      (select(downloads)
            ..where(
              (t) => t.dersId.equals(dersId) & t.status.equals('completed'),
            ))
          .get();

  Future<Set<int>> getDownloadedEpisodeIds(Set<int> episodeIds) async {
    if (episodeIds.isEmpty) return {};
    final rows = await (select(downloads)
          ..where(
            (t) =>
                t.entityType.equals('episode') &
                t.episodeId.isIn(episodeIds) &
                t.status.equals('completed'),
          ))
        .get();
    return rows
        .map((row) => row.episodeId)
        .whereType<int>()
        .toSet();
  }

  Future<List<Download>> getByEpisodeIds(Set<int> episodeIds) async {
    if (episodeIds.isEmpty) return [];
    return (select(downloads)
          ..where(
            (t) =>
                t.entityType.equals('episode') & t.episodeId.isIn(episodeIds),
          ))
        .get();
  }

  Future<int> insert(DownloadsCompanion entry) => into(downloads).insert(entry);

  Future<int> upsert(DownloadsCompanion entry) =>
      into(downloads).insertOnConflictUpdate(entry);

  Future<void> upsertEpisodeDownload(DownloadsCompanion entry) async {
    final episodeId = entry.episodeId.present ? entry.episodeId.value : null;
    if (episodeId == null) {
      await into(downloads).insert(entry);
      return;
    }

    final existing = await getByEpisodeId(episodeId);
    if (existing == null) {
      await into(downloads).insert(entry);
      return;
    }

    await (update(downloads)..where((t) => t.id.equals(existing.id))).write(
      entry.copyWith(id: Value(existing.id)),
    );
  }

  Future<void> upsertPdfDownload(DownloadsCompanion entry) async {
    final dersId = entry.dersId.value;
    final existing = await getPdfByDersId(dersId);
    if (existing == null) {
      await into(downloads).insert(entry);
      return;
    }

    await (update(downloads)..where((t) => t.id.equals(existing.id))).write(
      entry.copyWith(id: Value(existing.id)),
    );
  }

  Future<bool> updateEntry(Download entry) => update(downloads).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(downloads)..where((t) => t.id.equals(id))).go();

  Future<int> deleteByDersId(int dersId) =>
      (delete(downloads)..where((t) => t.dersId.equals(dersId))).go();

  Future<int> deleteAll() => delete(downloads).go();

  Future<int> totalCompletedBytes() async {
    final rows = await getCompleted();
    return rows.fold<int>(0, (sum, row) => sum + row.fileSizeBytes);
  }
}
