import 'package:drift/drift.dart';

import 'cached_episodes.dart';

@DataClassName('PlaybackProgress')
class Progress extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get episodeId => integer().references(CachedEpisodes, #id)();
  IntColumn get positionSeconds => integer().withDefault(const Constant(0))();
  BoolColumn get isCompleted =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
