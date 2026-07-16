import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/features/downloads/providers/wifi_only_provider.dart';
import 'package:islamic_learning_app/features/downloads/services/ders_download_service.dart';
import 'package:islamic_learning_app/features/downloads/services/download_storage_paths.dart';
import 'package:islamic_learning_app/features/home/models/home_models.dart';
import 'package:islamic_learning_app/features/home/providers/home_providers.dart';
import 'package:islamic_learning_app/features/settings/models/app_settings_keys.dart';
import 'package:islamic_learning_app/features/settings/providers/default_playback_speed_provider.dart';
import 'package:islamic_learning_app/features/settings/providers/theme_mode_provider.dart';
import 'package:islamic_learning_app/features/settings/services/clear_local_data_service.dart';

class _AlwaysWifi implements ConnectivityService {
  @override
  Future<bool> canDownload({required bool wifiOnly}) async => true;

  @override
  Future<bool> isOnWifi() async => true;
}

class _FakeDownloadService extends DersDownloadService {
  _FakeDownloadService(this._database)
      : super(
          db: _database,
          dio: Dio(),
          paths: DownloadStoragePaths(),
          connectivity: _AlwaysWifi(),
        );

  final AppDatabase _database;

  @override
  Future<void> clearAllDownloads() async {
    await _database.downloadsDao.deleteAll();
  }
}

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

  test('theme mode persists to settings table', () async {
    await container.read(themeModeProvider.future);
    await container.read(themeModeProvider.notifier).setMode(ThemeMode.dark);

    final stored = await db.settingsDao.getByKey(AppSettingsKeys.themeMode);
    expect(stored?.value, 'dark');

    final next = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(db)],
    );
    addTearDown(next.dispose);
    expect(await next.read(themeModeProvider.future), ThemeMode.dark);
  });

  test('browse mode and playback speed persist', () async {
    await container.read(homeBrowseModeProvider.future);
    await container
        .read(homeBrowseModeProvider.notifier)
        .setMode(HomeBrowseMode.topic);
    await container.read(defaultPlaybackSpeedProvider.future);
    await container.read(defaultPlaybackSpeedProvider.notifier).setSpeed(1.5);

    expect(
      (await db.settingsDao.getByKey(AppSettingsKeys.homeBrowseMode))?.value,
      'topic',
    );
    expect(
      (await db.settingsDao.getByKey(AppSettingsKeys.defaultPlaybackSpeed))
          ?.value,
      '1.5',
    );
  });

  test('wifi-only setting persists', () async {
    await container.read(wifiOnlyDownloadProvider.future);
    await container.read(wifiOnlyDownloadProvider.notifier).setEnabled(false);

    expect(
      (await db.settingsDao.getByKey(AppSettingsKeys.downloadWifiOnly))?.value,
      'false',
    );
  });

  test('clearUserData wipes progress favorites and downloads', () async {
    await db.cachedUstazesDao.insert(
      CachedUstazesCompanion.insert(
        id: const Value(1),
        name: 'Ustaz',
        slug: 'ustaz',
      ),
    );
    await db.cachedDersesDao.insert(
      CachedDersesCompanion.insert(
        id: const Value(100),
        title: 'Ders',
        slug: 'ders',
        ustazId: 1,
      ),
    );
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1000),
        dersId: 100,
        title: 'Ep',
        audioUrl: 'https://example.com/a.mp3',
        startPage: 1,
      ),
    );
    await db.progressDao.insert(
      ProgressCompanion.insert(episodeId: 1000),
    );
    await db.favoritesDao.insert(
      FavoritesCompanion.insert(entityType: 'ders', entityId: 100),
    );
    await db.downloadsDao.insert(
      DownloadsCompanion.insert(
        entityType: 'episode',
        dersId: 100,
        episodeId: const Value(1000),
        localPath: '/tmp/missing.mp3',
        status: const Value('completed'),
      ),
    );
    await db.settingsDao.upsert(
      SettingsCompanion.insert(
        key: AppSettingsKeys.themeMode,
        value: 'dark',
      ),
    );

    final clearer = ClearLocalDataService(
      db: db,
      downloads: _FakeDownloadService(db),
    );
    await clearer.clearUserData();

    expect(await db.progressDao.getAll(), isEmpty);
    expect(await db.favoritesDao.getAll(), isEmpty);
    expect(await db.downloadsDao.getAll(), isEmpty);
    expect(
      (await db.settingsDao.getByKey(AppSettingsKeys.themeMode))?.value,
      'dark',
    );
  });
}
