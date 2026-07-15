import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('upsertProgress inserts and updates playback state', () async {
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
        title: 'Foundations',
        slug: 'foundations',
        ustazId: 1,
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1000),
        dersId: 100,
        title: 'Episode 1',
        audioUrl: 'https://example.com/ep1.mp3',
        startPage: 1,
      ),
    );

    await db.progressDao.upsertProgress(
      episodeId: 1000,
      positionSeconds: 120,
      isCompleted: false,
    );

    var progress = await db.progressDao.getByEpisodeId(1000);
    expect(progress, isNotNull);
    expect(progress!.positionSeconds, 120);
    expect(progress.isCompleted, false);

    await db.progressDao.upsertProgress(
      episodeId: 1000,
      positionSeconds: 600,
      isCompleted: true,
    );

    progress = await db.progressDao.getByEpisodeId(1000);
    expect(progress!.positionSeconds, 600);
    expect(progress.isCompleted, true);
  });
}
