import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/features/derses/models/derses_models.dart';
import 'package:islamic_learning_app/features/derses/providers/derses_providers.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(db)],
    );
  });

  tearDown(() async {
    container.dispose();
    await db.close();
  });

  Future<void> seedContent() async {
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
        title: 'Foundations',
        slug: 'foundations',
        ustazId: 1,
        topicId: const Value(10),
        isPublished: const Value(true),
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1000),
        dersId: 100,
        title: 'Episode 1',
        audioUrl: 'https://example.com/ep1.mp3',
        startPage: 1,
        isPublished: const Value(true),
        durationSeconds: const Value(600),
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1001),
        dersId: 100,
        title: 'Episode 2',
        audioUrl: 'https://example.com/ep2.mp3',
        startPage: 20,
        isPublished: const Value(true),
        durationSeconds: const Value(900),
      ),
    );
    await db.progressDao.insert(
      ProgressCompanion.insert(
        episodeId: 1000,
        isCompleted: const Value(true),
      ),
    );
  }

  test('dersesByUstazProvider returns published derses only', () async {
    await seedContent();
    final derses = await container.read(dersesByUstazProvider(1).future);
    expect(derses, hasLength(1));
    expect(derses.first.title, 'Foundations');
  });

  test('dersDownloadStatusProvider reports partial and downloaded states', () async {
    await seedContent();

    var status = await container.read(dersDownloadStatusProvider(100).future);
    expect(status, DersDownloadStatus.none);

    await db.downloadsDao.insert(
      DownloadsCompanion.insert(
        entityType: 'episode',
        dersId: 100,
        episodeId: const Value(1000),
        localPath: '/downloads/ep1.mp3',
        status: const Value('completed'),
      ),
    );

    container.invalidate(dersDownloadStatusProvider(100));
    status = await container.read(dersDownloadStatusProvider(100).future);
    expect(status, DersDownloadStatus.partial);

    await db.downloadsDao.insert(
      DownloadsCompanion.insert(
        entityType: 'episode',
        dersId: 100,
        episodeId: const Value(1001),
        localPath: '/downloads/ep2.mp3',
        status: const Value('completed'),
      ),
    );

    container.invalidate(dersDownloadStatusProvider(100));
    status = await container.read(dersDownloadStatusProvider(100).future);
    expect(status, DersDownloadStatus.downloaded);
  });

  test('episodesWithProgressProvider marks completed episodes', () async {
    await seedContent();
    final episodes =
        await container.read(episodesWithProgressProvider(100).future);

    expect(episodes, hasLength(2));
    expect(episodes.first.isCompleted, true);
    expect(episodes.last.isCompleted, false);
  });
}
