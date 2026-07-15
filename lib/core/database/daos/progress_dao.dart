import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/progress.dart';

part 'progress_dao.g.dart';

@DriftAccessor(tables: [Progress])
class ProgressDao extends DatabaseAccessor<AppDatabase>
    with _$ProgressDaoMixin {
  ProgressDao(super.db);

  Future<List<PlaybackProgress>> getAll() => select(progress).get();

  Future<PlaybackProgress?> getById(int id) =>
      (select(progress)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<PlaybackProgress?> getByEpisodeId(int episodeId) =>
      (select(progress)..where((t) => t.episodeId.equals(episodeId)))
          .getSingleOrNull();

  Future<List<PlaybackProgress>> getRecentIncomplete({int limit = 10}) =>
      (select(progress)
            ..where((t) => t.isCompleted.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
            ..limit(limit))
          .get();

  Future<int> insert(ProgressCompanion entry) => into(progress).insert(entry);

  Future<void> upsertProgress({
    required int episodeId,
    required int positionSeconds,
    required bool isCompleted,
  }) async {
    final existing = await getByEpisodeId(episodeId);
    if (existing == null) {
      await into(progress).insert(
        ProgressCompanion.insert(
          episodeId: episodeId,
          positionSeconds: Value(positionSeconds),
          isCompleted: Value(isCompleted),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return;
    }

    await (update(progress)..where((t) => t.episodeId.equals(episodeId))).write(
      ProgressCompanion(
        positionSeconds: Value(positionSeconds),
        isCompleted: Value(isCompleted),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<bool> updateEntry(PlaybackProgress entry) =>
      update(progress).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(progress)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(progress).go();
}
