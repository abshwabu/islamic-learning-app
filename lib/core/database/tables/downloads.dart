import 'package:drift/drift.dart';

import 'cached_episodes.dart';

@DataClassName('Download')
class Downloads extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get episodeId => integer().references(CachedEpisodes, #id)();
  TextColumn get localPath => text()();
  IntColumn get fileSizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('completed'))();
  DateTimeColumn get downloadedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
