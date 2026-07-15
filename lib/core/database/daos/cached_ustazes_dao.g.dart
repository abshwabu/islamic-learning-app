// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_ustazes_dao.dart';

// ignore_for_file: type=lint
mixin _$CachedUstazesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedUstazesTable get cachedUstazes => attachedDatabase.cachedUstazes;
  CachedUstazesDaoManager get managers => CachedUstazesDaoManager(this);
}

class CachedUstazesDaoManager {
  final _$CachedUstazesDaoMixin _db;
  CachedUstazesDaoManager(this._db);
  $$CachedUstazesTableTableManager get cachedUstazes =>
      $$CachedUstazesTableTableManager(_db.attachedDatabase, _db.cachedUstazes);
}
