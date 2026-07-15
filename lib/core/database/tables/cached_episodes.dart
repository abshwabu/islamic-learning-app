import 'package:drift/drift.dart';

import 'cached_derses.dart';

@DataClassName('CachedEpisode')
class CachedEpisodes extends Table {
  IntColumn get id => integer()();
  IntColumn get dersId => integer().references(CachedDerses, #id)();
  TextColumn get title => text()();
  TextColumn get audioUrl => text()();
  IntColumn get startPage => integer()();
  IntColumn get endPage => integer().withDefault(const Constant(0))();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isPublished =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
