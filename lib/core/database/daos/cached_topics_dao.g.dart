// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_topics_dao.dart';

// ignore_for_file: type=lint
mixin _$CachedTopicsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedTopicsTable get cachedTopics => attachedDatabase.cachedTopics;
  CachedTopicsDaoManager get managers => CachedTopicsDaoManager(this);
}

class CachedTopicsDaoManager {
  final _$CachedTopicsDaoMixin _db;
  CachedTopicsDaoManager(this._db);
  $$CachedTopicsTableTableManager get cachedTopics =>
      $$CachedTopicsTableTableManager(_db.attachedDatabase, _db.cachedTopics);
}
