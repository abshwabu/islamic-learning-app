// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_derses_dao.dart';

// ignore_for_file: type=lint
mixin _$CachedDersesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedUstazesTable get cachedUstazes => attachedDatabase.cachedUstazes;
  $CachedTopicsTable get cachedTopics => attachedDatabase.cachedTopics;
  $CachedDersesTable get cachedDerses => attachedDatabase.cachedDerses;
  CachedDersesDaoManager get managers => CachedDersesDaoManager(this);
}

class CachedDersesDaoManager {
  final _$CachedDersesDaoMixin _db;
  CachedDersesDaoManager(this._db);
  $$CachedUstazesTableTableManager get cachedUstazes =>
      $$CachedUstazesTableTableManager(_db.attachedDatabase, _db.cachedUstazes);
  $$CachedTopicsTableTableManager get cachedTopics =>
      $$CachedTopicsTableTableManager(_db.attachedDatabase, _db.cachedTopics);
  $$CachedDersesTableTableManager get cachedDerses =>
      $$CachedDersesTableTableManager(_db.attachedDatabase, _db.cachedDerses);
}
