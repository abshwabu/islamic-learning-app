import 'package:drift/drift.dart';

@DataClassName('CachedTopic')
class CachedTopics extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get slug => text()();
  TextColumn get icon => text().nullable()();
  TextColumn get color => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
