// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_dao.dart';

// ignore_for_file: type=lint
mixin _$DownloadsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedUstazesTable get cachedUstazes => attachedDatabase.cachedUstazes;
  $CachedTopicsTable get cachedTopics => attachedDatabase.cachedTopics;
  $CachedDersesTable get cachedDerses => attachedDatabase.cachedDerses;
  $CachedEpisodesTable get cachedEpisodes => attachedDatabase.cachedEpisodes;
  $DownloadsTable get downloads => attachedDatabase.downloads;
  DownloadsDaoManager get managers => DownloadsDaoManager(this);
}

class DownloadsDaoManager {
  final _$DownloadsDaoMixin _db;
  DownloadsDaoManager(this._db);
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
  $$DownloadsTableTableManager get downloads =>
      $$DownloadsTableTableManager(_db.attachedDatabase, _db.downloads);
}
