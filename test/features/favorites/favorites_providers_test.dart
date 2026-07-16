import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/features/favorites/models/favorite_entity_type.dart';
import 'package:islamic_learning_app/features/favorites/providers/favorites_providers.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(db)],
    );

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
      ),
    );
  });

  tearDown(() async {
    container.dispose();
    await db.close();
  });

  test('toggle favorite ders and list it', () async {
    final repo = container.read(favoritesRepositoryProvider);

    expect(await repo.toggleDers(100), true);
    expect(
      await db.favoritesDao.isFavorite(FavoriteEntityType.ders, 100),
      true,
    );

    final items = await container.read(favoriteDersesProvider.future);
    expect(items, hasLength(1));
    expect(items.first.ders.title, 'Foundations');

    expect(await repo.toggleDers(100), false);
    container.invalidate(favoriteDersesProvider);
    expect(await container.read(favoriteDersesProvider.future), isEmpty);
  });

  test('toggle favorite episode and list it', () async {
    final repo = container.read(favoritesRepositoryProvider);

    expect(await repo.toggleEpisode(1000), true);
    final items = await container.read(favoriteEpisodesProvider.future);
    expect(items, hasLength(1));
    expect(items.first.episode.title, 'Episode 1');
    expect(items.first.ders.id, 100);
  });
}
