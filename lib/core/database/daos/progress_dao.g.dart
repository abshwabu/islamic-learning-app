// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dao.dart';

// ignore_for_file: type=lint
mixin _$ProgressDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedUstazesTable get cachedUstazes => attachedDatabase.cachedUstazes;
  $CachedTopicsTable get cachedTopics => attachedDatabase.cachedTopics;
  $CachedDersesTable get cachedDerses => attachedDatabase.cachedDerses;
  $CachedEpisodesTable get cachedEpisodes => attachedDatabase.cachedEpisodes;
  $ProgressTable get progress => attachedDatabase.progress;
  ProgressDaoManager get managers => ProgressDaoManager(this);
}

class ProgressDaoManager {
  final _$ProgressDaoMixin _db;
  ProgressDaoManager(this._db);
  $$CachedUstazesTableTableManager get cachedUstazes =>
      $$CachedUstazesTableTableManager(_db.attachedDatabase, _db.cachedUstazes);
  $$CachedTopicsTableTableManager get cachedTopics =>
      $$CachedTopicsTableTableManager(_db.attachedDatabase, _db.cachedTopics);
  $$CachedDersesTableTableManager get cachedDerses =>
      $$CachedDersesTableTableManager(_db.attachedDatabase, _db.cachedDerses);
  $$CachedEpisodesTableTableManager get cachedEpisodes =>
      $$CachedEpisodesTableTableManager(
        _db.attachedDatabase,
        _db.cachedEpisodes,
      );
  $$ProgressTableTableManager get progress =>
      $$ProgressTableTableManager(_db.attachedDatabase, _db.progress);
}
