import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/features/home/models/home_models.dart';
import 'package:islamic_learning_app/features/home/providers/home_providers.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(db),
      ],
    );
  });

  tearDown(() async {
    container.dispose();
    await db.close();
  });

  test('home browse mode persists to settings', () async {
    await container.read(homeBrowseModeProvider.future);
    await container.read(homeBrowseModeProvider.notifier).setMode(HomeBrowseMode.topic);

    final stored = await db.settingsDao.getByKey('home_browse_mode');
    expect(stored?.value, 'topic');

    final container2 = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(db)],
    );
    addTearDown(container2.dispose);

    final mode = await container2.read(homeBrowseModeProvider.future);
    expect(mode, HomeBrowseMode.topic);
  });

  test('search filters ustazes by name and matching ders titles', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz Ahmad',
        slug: 'ustaz-ahmad',
      ),
    );
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(2),
        name: 'Ustaz Yusuf',
        slug: 'ustaz-yusuf',
      ),
    );
    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(100),
        title: 'Foundations of Tawhid',
        slug: 'foundations',
        ustazId: 2,
        isPublished: const Value(true),
      ),
    );

    container.read(homeSearchQueryProvider.notifier).state = 'tawhid';
    final results = await container.read(filteredUstazesProvider.future);

    expect(results.map((u) => u.id), [2]);
  });
}
