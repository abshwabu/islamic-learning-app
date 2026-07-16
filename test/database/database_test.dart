import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';

AppDatabase createTestDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDatabase();
  });

  tearDown(() async {
    await db.close();
  });

  test('cached_ustazes CRUD', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz Ahmad',
        slug: 'ustaz-ahmad',
        bio: const Value('Scholar of tafsir'),
        photoUrl: const Value('https://example.com/photo.jpg'),
        sortOrder: const Value(0),
        isActive: const Value(true),
      ),
    );

    final row = await db.cachedUstazesDao.getById(1);
    expect(row, isNotNull);
    expect(row!.name, 'Ustaz Ahmad');
    expect(row.slug, 'ustaz-ahmad');
    expect(row.isActive, true);
  });

  test('cached_topics CRUD', () async {
    await db.cachedTopicsDao.insert(
      CachedTopicsCompanion.insert(
        id: const Value(10),
        name: 'Aqeedah',
        slug: 'aqeedah',
        icon: const Value('book'),
        color: const Value('#1B5E20'),
        sortOrder: const Value(0),
      ),
    );

    final row = await db.cachedTopicsDao.getById(10);
    expect(row, isNotNull);
    expect(row!.name, 'Aqeedah');
    expect(row.color, '#1B5E20');
  });

  test('cached_derses CRUD', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz Ahmad',
        slug: 'ustaz-ahmad',
      ),
    );
    await db.cachedTopicsDao.insert(
      CachedTopicsCompanion.insert(
        id: const Value(10),
        name: 'Aqeedah',
        slug: 'aqeedah',
      ),
    );

    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(100),
        title: 'Foundations of Faith',
        slug: 'foundations-of-faith',
        ustazId: 1,
        topicId: const Value(10),
        pdfUrl: const Value('https://example.com/ders.pdf'),
        pdfPageCount: const Value(120),
        coverImageUrl: const Value('https://example.com/cover.jpg'),
        isPublished: const Value(true),
      ),
    );

    final row = await db.cachedDersesDao.getById(100);
    expect(row, isNotNull);
    expect(row!.title, 'Foundations of Faith');
    expect(row.pdfPageCount, 120);
    expect(row.isPublished, true);
  });

  test('cached_episodes CRUD with end_page recalculation', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz Ahmad',
        slug: 'ustaz-ahmad',
      ),
    );
    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(100),
        title: 'Foundations of Faith',
        slug: 'foundations-of-faith',
        ustazId: 1,
        pdfPageCount: const Value(50),
      ),
    );

    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1000),
        dersId: 100,
        title: 'Episode 1',
        audioUrl: 'https://example.com/ep1.mp3',
        startPage: 1,
        durationSeconds: const Value(1800),
        sortOrder: const Value(0),
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1001),
        dersId: 100,
        title: 'Episode 2',
        audioUrl: 'https://example.com/ep2.mp3',
        startPage: 20,
        durationSeconds: const Value(2100),
        sortOrder: const Value(1),
      ),
    );

    final ep1 = await db.cachedEpisodesDao.getById(1000);
    final ep2 = await db.cachedEpisodesDao.getById(1001);

    expect(ep1, isNotNull);
    expect(ep2, isNotNull);
    expect(ep1!.endPage, 19);
    expect(ep2!.endPage, 50);
  });

  test('ustazes reorder updates sort_order', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'First',
        slug: 'first',
        sortOrder: const Value(0),
      ),
    );
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(2),
        name: 'Second',
        slug: 'second',
        sortOrder: const Value(1),
      ),
    );

    await db.cachedUstazesDao.reorder([2, 1]);

    final rows = await db.cachedUstazesDao.getAll();
    expect(rows[0].id, 2);
    expect(rows[0].sortOrder, 0);
    expect(rows[1].id, 1);
    expect(rows[1].sortOrder, 1);
  });

  test('downloads CRUD', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz Ahmad',
        slug: 'ustaz-ahmad',
      ),
    );
    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(100),
        title: 'Foundations of Faith',
        slug: 'foundations-of-faith',
        ustazId: 1,
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1000),
        dersId: 100,
        title: 'Episode 1',
        audioUrl: 'https://example.com/audio.mp3',
        startPage: 1,
      ),
    );

    final downloadId = await db.downloadsDao.insert(
      DownloadsCompanion.insert(
        entityType: 'episode',
        dersId: 100,
        episodeId: const Value(1000),
        localPath: '/data/downloads/episode_1000.mp3',
        fileSizeBytes: const Value(5_000_000),
        status: const Value('completed'),
      ),
    );

    final row = await db.downloadsDao.getById(downloadId);
    expect(row, isNotNull);
    expect(row!.localPath, '/data/downloads/episode_1000.mp3');
  });

  test('progress CRUD', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz Ahmad',
        slug: 'ustaz-ahmad',
      ),
    );
    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(100),
        title: 'Foundations of Faith',
        slug: 'foundations-of-faith',
        ustazId: 1,
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1000),
        dersId: 100,
        title: 'Episode 1',
        audioUrl: 'https://example.com/audio.mp3',
        startPage: 1,
      ),
    );

    final progressId = await db.progressDao.insert(
      ProgressCompanion.insert(
        episodeId: 1000,
        positionSeconds: const Value(300),
      ),
    );

    final row = await db.progressDao.getById(progressId);
    expect(row, isNotNull);
    expect(row!.positionSeconds, 300);
  });

  test('favorites CRUD', () async {
    final favoriteId = await db.favoritesDao.insert(
      FavoritesCompanion.insert(
        entityType: 'ders',
        entityId: 100,
      ),
    );

    final row = await db.favoritesDao.getById(favoriteId);
    expect(row, isNotNull);
    expect(row!.entityType, 'ders');
  });

  test('settings CRUD', () async {
    await db.settingsDao.insert(
      SettingsCompanion.insert(
        key: 'theme_mode',
        value: 'dark',
      ),
    );

    final row = await db.settingsDao.getByKey('theme_mode');
    expect(row, isNotNull);
    expect(row!.value, 'dark');
  });
}
