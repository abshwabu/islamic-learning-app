import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/settings.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<List<AppSetting>> getAll() => select(settings).get();

  Future<AppSetting?> getByKey(String key) =>
      (select(settings)..where((t) => t.key.equals(key))).getSingleOrNull();

  Future<int> insert(SettingsCompanion entry) => into(settings).insert(entry);

  Future<bool> updateEntry(AppSetting entry) => update(settings).replace(entry);

  Future<int> upsert(SettingsCompanion entry) =>
      into(settings).insertOnConflictUpdate(entry);

  Future<int> deleteByKey(String key) =>
      (delete(settings)..where((t) => t.key.equals(key))).go();

  Future<int> deleteAll() => delete(settings).go();
}
