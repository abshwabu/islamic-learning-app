import 'package:drift/drift.dart';

import 'cached_derses.dart';
import 'cached_episodes.dart';

/// Stores offline files for a ders: episode audio (`entityType = episode`)
/// and the ders PDF (`entityType = pdf`).
@DataClassName('Download')
class Downloads extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  IntColumn get dersId => integer().references(CachedDerses, #id)();
  IntColumn get episodeId =>
      integer().nullable().references(CachedEpisodes, #id)();
  TextColumn get localPath => text()();
  IntColumn get fileSizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get downloadedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
