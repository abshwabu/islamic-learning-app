import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Derses, Favorites, Downloads])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'islamic_learning_app');
  }

  Future<List<Ders>> getAllDerses() => select(derses).get();

  Future<int> insertDers(DersesCompanion entry) => into(derses).insert(entry);

  Stream<List<Favorite>> watchFavorites() => select(favorites).watch();

  Future<int> addFavorite(int dersId) {
    return into(favorites).insert(
      FavoritesCompanion(dersId: Value(dersId)),
    );
  }

  Future<int> removeFavorite(int dersId) {
    return (delete(favorites)..where((t) => t.dersId.equals(dersId))).go();
  }
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});
