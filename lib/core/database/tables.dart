import 'package:drift/drift.dart';

@DataClassName('Ders')
class Derses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get speaker => text()();
  TextColumn get description => text().nullable()();
  TextColumn get audioUrl => text()();
  TextColumn get thumbnailUrl => text().nullable()();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dersId => integer().references(Derses, #id)();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}

class Downloads extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dersId => integer().references(Derses, #id)();
  TextColumn get localPath => text()();
  DateTimeColumn get downloadedAt => dateTime().withDefault(currentDateAndTime)();
}
