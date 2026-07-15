import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daos/cached_derses_dao.dart';
import 'daos/cached_episodes_dao.dart';
import 'daos/cached_topics_dao.dart';
import 'daos/cached_ustazes_dao.dart';
import 'daos/downloads_dao.dart';
import 'daos/favorites_dao.dart';
import 'daos/progress_dao.dart';
import 'daos/settings_dao.dart';
import 'tables/tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    CachedUstazes,
    CachedTopics,
    CachedDerses,
    CachedEpisodes,
    Downloads,
    Progress,
    Favorites,
    Settings,
  ],
  daos: [
    CachedUstazesDao,
    CachedTopicsDao,
    CachedDersesDao,
    CachedEpisodesDao,
    DownloadsDao,
    ProgressDao,
    FavoritesDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 3) {
            for (final table in [
              'cached_episodes',
              'cached_derses',
              'cached_topics',
              'cached_ustazes',
            ]) {
              await m.deleteTable(table);
            }
            await m.createAll();
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'islamic_learning_app');
  }
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});
