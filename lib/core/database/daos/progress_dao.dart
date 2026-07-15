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

  Future<int> insert(ProgressCompanion entry) => into(progress).insert(entry);

  Future<bool> updateEntry(PlaybackProgress entry) =>
      update(progress).replace(entry);

  Future<int> deleteById(int id) =>
      (delete(progress)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAll() => delete(progress).go();
}
