import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../../core/network/dio_client.dart';
import '../models/download_models.dart';
import '../models/downloaded_ders_item.dart';
import '../providers/wifi_only_provider.dart';
import 'download_storage_paths.dart';

final dersDownloadServiceProvider = Provider<DersDownloadService>((ref) {
  return DersDownloadService(
    db: ref.watch(databaseProvider),
    dio: ref.watch(dioProvider),
    paths: DownloadStoragePaths(),
    connectivity: ref.watch(connectivityServiceProvider),
  );
});

class WifiRequiredException implements Exception {
  @override
  String toString() => 'Downloads are restricted to Wi‑Fi. Connect to Wi‑Fi and try again.';
}

class DersDownloadService {
  DersDownloadService({
    required AppDatabase db,
    required Dio dio,
    required DownloadStoragePaths paths,
    required ConnectivityService connectivity,
  })  : _db = db,
        _dio = dio,
        _paths = paths,
        _connectivity = connectivity;

  final AppDatabase _db;
  final Dio _dio;
  final DownloadStoragePaths _paths;
  final ConnectivityService _connectivity;

  final Map<int, CancelToken> _cancelTokens = {};

  Future<void> downloadDers({
    required int dersId,
    required bool wifiOnly,
    required void Function(DersDownloadProgress progress) onProgress,
  }) async {
    if (!await _connectivity.canDownload(wifiOnly: wifiOnly)) {
      throw WifiRequiredException();
    }

    final ders = await _db.cachedDersesDao.getById(dersId);
    if (ders == null) {
      throw StateError('Ders not found');
    }

    final episodes = await _db.cachedEpisodesDao.getPublishedByDersId(dersId);
    final files = <DownloadFileProgress>[];

    if (ders.pdfUrl != null && ders.pdfUrl!.isNotEmpty) {
      final existingPdf = await _db.downloadsDao.getPdfByDersId(dersId);
      if (existingPdf?.status == 'completed' &&
          await File(existingPdf!.localPath).exists()) {
        files.add(
          DownloadFileProgress(
            key: 'pdf_$dersId',
            label: 'PDF',
            kind: DownloadFileKind.pdf,
            receivedBytes: existingPdf.fileSizeBytes,
            totalBytes: existingPdf.fileSizeBytes,
            status: DownloadFileStatus.completed,
          ),
        );
      } else {
        files.add(
          DownloadFileProgress(
            key: 'pdf_$dersId',
            label: 'PDF',
            kind: DownloadFileKind.pdf,
          ),
        );
      }
    }

    for (final episode in episodes) {
      final existing = await _db.downloadsDao.getByEpisodeId(episode.id);
      if (existing?.status == 'completed' &&
          await File(existing!.localPath).exists()) {
        files.add(
          DownloadFileProgress(
            key: 'episode_${episode.id}',
            label: episode.title,
            kind: DownloadFileKind.episode,
            episodeId: episode.id,
            receivedBytes: existing.fileSizeBytes,
            totalBytes: existing.fileSizeBytes,
            status: DownloadFileStatus.completed,
          ),
        );
      } else {
        files.add(
          DownloadFileProgress(
            key: 'episode_${episode.id}',
            label: episode.title,
            kind: DownloadFileKind.episode,
            episodeId: episode.id,
          ),
        );
      }
    }

    var progress = DersDownloadProgress(
      dersId: dersId,
      files: files,
      isRunning: true,
    );
    onProgress(progress);

    final cancelToken = CancelToken();
    _cancelTokens[dersId] = cancelToken;

    try {
      for (var i = 0; i < files.length; i++) {
        if (cancelToken.isCancelled) break;

        if (!await _connectivity.canDownload(wifiOnly: wifiOnly)) {
          throw WifiRequiredException();
        }

        final file = files[i];
        if (file.status == DownloadFileStatus.completed) continue;

        files[i] = file.copyWith(status: DownloadFileStatus.downloading);
        progress = progress.copyWith(files: List.of(files), clearError: true);
        onProgress(progress);

        try {
          if (file.kind == DownloadFileKind.pdf) {
            await _downloadPdf(
              ders: ders,
              onBytes: (received, total) {
                files[i] = files[i].copyWith(
                  receivedBytes: received,
                  totalBytes: total > 0 ? total : files[i].totalBytes,
                  status: DownloadFileStatus.downloading,
                );
                onProgress(progress.copyWith(files: List.of(files)));
              },
              cancelToken: cancelToken,
            );
          } else {
            final episode =
                episodes.firstWhere((e) => e.id == file.episodeId);
            await _downloadEpisode(
              ders: ders,
              episode: episode,
              onBytes: (received, total) {
                files[i] = files[i].copyWith(
                  receivedBytes: received,
                  totalBytes: total > 0 ? total : files[i].totalBytes,
                  status: DownloadFileStatus.downloading,
                );
                onProgress(progress.copyWith(files: List.of(files)));
              },
              cancelToken: cancelToken,
            );
          }

          final completedSize = files[i].totalBytes > 0
              ? files[i].totalBytes
              : files[i].receivedBytes;
          files[i] = files[i].copyWith(
            status: DownloadFileStatus.completed,
            receivedBytes: completedSize,
            totalBytes: completedSize,
          );
          onProgress(progress.copyWith(files: List.of(files)));
        } on Object catch (error) {
          if (cancelToken.isCancelled) rethrow;
          files[i] = files[i].copyWith(
            status: DownloadFileStatus.failed,
            errorMessage: error.toString(),
          );
          onProgress(
            progress.copyWith(
              files: List.of(files),
              errorMessage: error.toString(),
            ),
          );
          rethrow;
        }
      }

      onProgress(
        progress.copyWith(
          files: List.of(files),
          isRunning: false,
          clearError: true,
        ),
      );
    } finally {
      _cancelTokens.remove(dersId);
    }
  }

  void cancel(int dersId) {
    _cancelTokens.remove(dersId)?.cancel('Download cancelled');
  }

  Future<void> _downloadPdf({
    required CachedDers ders,
    required void Function(int received, int total) onBytes,
    required CancelToken cancelToken,
  }) async {
    final target = await _paths.dersPdfFile(ders.id);
    await _downloadToFile(
      url: ders.pdfUrl!,
      target: target,
      onBytes: onBytes,
      cancelToken: cancelToken,
    );

    final size = await target.length();
    await _db.downloadsDao.upsertPdfDownload(
      DownloadsCompanion.insert(
        entityType: 'pdf',
        dersId: ders.id,
        localPath: target.path,
        fileSizeBytes: Value(size),
        status: const Value('completed'),
        downloadedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> _downloadEpisode({
    required CachedDers ders,
    required CachedEpisode episode,
    required void Function(int received, int total) onBytes,
    required CancelToken cancelToken,
  }) async {
    final target = await _paths.episodeAudioFile(
      ders.id,
      episode.id,
      episode.audioUrl,
    );
    await _downloadToFile(
      url: episode.audioUrl,
      target: target,
      onBytes: onBytes,
      cancelToken: cancelToken,
    );

    final size = await target.length();
    await _db.downloadsDao.upsertEpisodeDownload(
      DownloadsCompanion.insert(
        entityType: 'episode',
        dersId: ders.id,
        episodeId: Value(episode.id),
        localPath: target.path,
        fileSizeBytes: Value(size),
        status: const Value('completed'),
        downloadedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> _downloadToFile({
    required String url,
    required File target,
    required void Function(int received, int total) onBytes,
    required CancelToken cancelToken,
  }) async {
    await target.parent.create(recursive: true);
    final temp = File('${target.path}.part');
    if (await temp.exists()) {
      await temp.delete();
    }

    await _dio.download(
      url,
      temp.path,
      cancelToken: cancelToken,
      onReceiveProgress: (received, total) {
        onBytes(received, total);
      },
    );

    if (await target.exists()) {
      await target.delete();
    }
    await temp.rename(target.path);
  }

  Future<List<DownloadedDersItem>> listDownloadedDerses() async {
    final downloads = await _db.downloadsDao.getCompleted();
    if (downloads.isEmpty) return [];

    final byDers = <int, List<Download>>{};
    for (final download in downloads) {
      byDers.putIfAbsent(download.dersId, () => []).add(download);
    }

    final items = <DownloadedDersItem>[];
    for (final entry in byDers.entries) {
      final ders = await _db.cachedDersesDao.getById(entry.key);
      if (ders == null) continue;

      final bytes = entry.value.fold<int>(
        0,
        (sum, row) => sum + row.fileSizeBytes,
      );
      final episodeCount = entry.value
          .where((row) => row.entityType == 'episode')
          .length;
      final hasPdf = entry.value.any((row) => row.entityType == 'pdf');

      items.add(
        DownloadedDersItem(
          ders: ders,
          bytesUsed: bytes,
          episodeCount: episodeCount,
          hasPdf: hasPdf,
        ),
      );
    }

    items.sort((a, b) => a.ders.title.compareTo(b.ders.title));
    return items;
  }

  Future<int> totalStorageUsed() => _db.downloadsDao.totalCompletedBytes();

  Future<void> deleteDersDownloads(int dersId) async {
    cancel(dersId);
    final downloads = await _db.downloadsDao.getByDersId(dersId);
    for (final download in downloads) {
      final file = File(download.localPath);
      if (await file.exists()) {
        await file.delete();
      }
      final part = File('${download.localPath}.part');
      if (await part.exists()) {
        await part.delete();
      }
    }

    final dir = await _paths.dersDirectory(dersId);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }

    await _db.downloadsDao.deleteByDersId(dersId);
  }

  Future<void> clearAllDownloads() async {
    final downloads = await _db.downloadsDao.getAll();
    final dersIds = downloads.map((d) => d.dersId).toSet();
    for (final dersId in dersIds) {
      await deleteDersDownloads(dersId);
    }
  }

  /// Returns a local PDF path if a completed download exists.
  Future<File?> localPdfFile(int dersId) async {
    final download = await _db.downloadsDao.getPdfByDersId(dersId);
    if (download == null || download.status != 'completed') return null;
    final file = File(download.localPath);
    if (await file.exists()) return file;
    return null;
  }
}
