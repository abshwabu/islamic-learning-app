import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cached_derses.dart';
import '../tables/cached_episodes.dart';

part 'cached_episodes_dao.g.dart';

@DriftAccessor(tables: [CachedEpisodes, CachedDerses])
class CachedEpisodesDao extends DatabaseAccessor<AppDatabase>
    with _$CachedEpisodesDaoMixin {
  CachedEpisodesDao(super.db);

  Future<List<CachedEpisode>> getAll() => (select(cachedEpisodes)
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<CachedEpisode?> getById(int id) =>
      (select(cachedEpisodes)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<List<CachedEpisode>> getByDersId(int dersId) =>
      (select(cachedEpisodes)
            ..where((t) => t.dersId.equals(dersId))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();

  Future<List<CachedEpisode>> getPublishedByDersId(int dersId) =>
      (select(cachedEpisodes)
            ..where(
              (t) => t.dersId.equals(dersId) & t.isPublished.equals(true),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();

  Future<int> insert(CachedEpisodesCompanion entry) async {
    final id = await into(cachedEpisodes).insert(entry);
    await recalculateEndPages(entry.dersId.value);
    return id;
  }

  Future<bool> updateEntry(CachedEpisode entry) async {
    final updated = await update(cachedEpisodes).replace(entry);
    if (updated) await recalculateEndPages(entry.dersId);
    return updated;
  }

  Future<int> deleteById(int id) async {
    final episode = await getById(id);
    final count =
        await (delete(cachedEpisodes)..where((t) => t.id.equals(id))).go();
    if (episode != null) await recalculateEndPages(episode.dersId);
    return count;
  }

  Future<int> deleteAll() => delete(cachedEpisodes).go();

  Future<void> reorder(int dersId, List<int> orderedIds) async {
    await batch((b) {
      for (var i = 0; i < orderedIds.length; i++) {
        b.update(
          cachedEpisodes,
          CachedEpisodesCompanion(sortOrder: Value(i)),
          where: (t) => t.id.equals(orderedIds[i]),
        );
      }
    });
    await recalculateEndPages(dersId);
  }

  /// Sets each episode's [endPage] to the next episode's startPage - 1,
  /// or the ders pdfPageCount for the last episode.
  Future<void> recalculateEndPages(int dersId) async {
    final ders = await (select(cachedDerses)
          ..where((t) => t.id.equals(dersId)))
        .getSingleOrNull();
    if (ders == null) return;

    final episodes = await getByDersId(dersId);
    if (episodes.isEmpty) return;

    await batch((b) {
      for (var i = 0; i < episodes.length; i++) {
        final endPage = i < episodes.length - 1
            ? episodes[i + 1].startPage - 1
            : ders.pdfPageCount;

        b.update(
          cachedEpisodes,
          CachedEpisodesCompanion(endPage: Value(endPage)),
          where: (t) => t.id.equals(episodes[i].id),
        );
      }
    });
  }
}
