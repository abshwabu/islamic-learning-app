// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_episodes_dao.dart';

// ignore_for_file: type=lint
mixin _$CachedEpisodesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedUstazesTable get cachedUstazes => attachedDatabase.cachedUstazes;
  $CachedTopicsTable get cachedTopics => attachedDatabase.cachedTopics;
  $CachedDersesTable get cachedDerses => attachedDatabase.cachedDerses;
  $CachedEpisodesTable get cachedEpisodes => attachedDatabase.cachedEpisodes;
  CachedEpisodesDaoManager get managers => CachedEpisodesDaoManager(this);
}

class CachedEpisodesDaoManager {
  final _$CachedEpisodesDaoMixin _db;
  CachedEpisodesDaoManager(this._db);
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
}
