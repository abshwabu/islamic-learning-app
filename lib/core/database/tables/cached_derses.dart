import 'package:drift/drift.dart';

import 'cached_topics.dart';
import 'cached_ustazes.dart';

@DataClassName('CachedDers')
class CachedDerses extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get slug => text()();
  TextColumn get description => text().nullable()();
  TextColumn get coverImageUrl => text().nullable()();
  TextColumn get pdfUrl => text().nullable()();
  IntColumn get pdfPageCount => integer().withDefault(const Constant(0))();
  IntColumn get ustazId => integer().references(CachedUstazes, #id)();
  IntColumn get topicId =>
      integer().nullable().references(CachedTopics, #id)();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isPublished =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
