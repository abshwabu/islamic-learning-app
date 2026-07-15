import 'package:drift/drift.dart';

@DataClassName('CachedUstaze')
class CachedUstazes extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get slug => text()();
  TextColumn get bio => text().nullable()();
  TextColumn get photoUrl => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
