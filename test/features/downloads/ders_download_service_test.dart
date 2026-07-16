import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_learning_app/core/database/database.dart';
import 'package:islamic_learning_app/features/downloads/models/download_models.dart';
import 'package:islamic_learning_app/features/downloads/providers/wifi_only_provider.dart';
import 'package:islamic_learning_app/features/downloads/services/ders_download_service.dart';
import 'package:islamic_learning_app/features/downloads/services/download_storage_paths.dart';
import 'package:path/path.dart' as p;

class _FakeConnectivity implements ConnectivityService {
  _FakeConnectivity({required this.onWifi});

  bool onWifi;

  @override
  Future<bool> canDownload({required bool wifiOnly}) async {
    if (!wifiOnly) return true;
    return onWifi;
  }

  @override
  Future<bool> isOnWifi() async => onWifi;
}

class _MemoryAdapter implements HttpClientAdapter {
  _MemoryAdapter(this.payloads);

  final Map<String, List<int>> payloads;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final bytes = payloads[options.uri.toString()] ?? [1, 2, 3, 4];
    return ResponseBody.fromBytes(
      bytes,
      200,
      headers: {
        Headers.contentLengthHeader: [bytes.length.toString()],
      },
    );
  }
}

class _TestPaths extends DownloadStoragePaths {
  _TestPaths(this.root);

  final Directory root;

  @override
  Future<Directory> dersDirectory(int dersId) async {
    final dir = Directory(p.join(root.path, 'ders_$dersId'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }
}

void main() {
  late AppDatabase db;
  late Directory tempDir;
  late Dio dio;
  late DersDownloadService service;
  late _FakeConnectivity connectivity;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    tempDir = await Directory.systemTemp.createTemp('ila_downloads_');
    connectivity = _FakeConnectivity(onWifi: true);
    dio = Dio();
    dio.httpClientAdapter = _MemoryAdapter({
      'https://example.com/ders.pdf': List<int>.filled(100, 1),
      'https://example.com/ep1.mp3': List<int>.filled(200, 2),
      'https://example.com/ep2.mp3': List<int>.filled(300, 3),
    });

    service = DersDownloadService(
      db: db,
      dio: dio,
      paths: _TestPaths(tempDir),
      connectivity: connectivity,
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
        pdfUrl: const Value('https://example.com/ders.pdf'),
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
    await db.cachedEpisodesDao.insert(
      CachedEpisodesCompanion.insert(
        id: const Value(1001),
        dersId: 100,
        title: 'Episode 2',
        audioUrl: 'https://example.com/ep2.mp3',
        startPage: 20,
        isPublished: const Value(true),
      ),
    );
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('downloadDers saves pdf and episodes with progress updates', () async {
    final updates = <DersDownloadProgress>[];

    await service.downloadDers(
      dersId: 100,
      wifiOnly: true,
      onProgress: updates.add,
    );

    expect(updates, isNotEmpty);
    expect(updates.last.isRunning, false);
    expect(updates.last.completedCount, 3);

    final downloads = await db.downloadsDao.getCompletedByDersId(100);
    expect(downloads, hasLength(3));
    expect(downloads.any((d) => d.entityType == 'pdf'), true);
    expect(
      downloads.where((d) => d.entityType == 'episode'),
      hasLength(2),
    );

    for (final download in downloads) {
      expect(File(download.localPath).existsSync(), true);
      expect(download.fileSizeBytes, greaterThan(0));
    }
  });

  test('downloadDers respects wifi-only setting', () async {
    connectivity.onWifi = false;

    expect(
      () => service.downloadDers(
        dersId: 100,
        wifiOnly: true,
        onProgress: (_) {},
      ),
      throwsA(isA<WifiRequiredException>()),
    );
  });

  test('deleteDersDownloads removes files and rows', () async {
    await service.downloadDers(
      dersId: 100,
      wifiOnly: false,
      onProgress: (_) {},
    );

    await service.deleteDersDownloads(100);

    expect(await db.downloadsDao.getByDersId(100), isEmpty);
    expect(await service.totalStorageUsed(), 0);
  });
}
