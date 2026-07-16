import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../core/database/database.dart';
import '../../../core/network/dio_client.dart';
import '../../downloads/services/ders_download_service.dart';

final pdfCacheServiceProvider = Provider<PdfCacheService>((ref) {
  return PdfCacheService(
    dio: ref.watch(dioProvider),
    downloadService: ref.watch(dersDownloadServiceProvider),
  );
});

class PdfCacheService {
  PdfCacheService({
    required Dio dio,
    required DersDownloadService downloadService,
  })  : _dio = dio,
        _downloadService = downloadService;

  final Dio _dio;
  final DersDownloadService _downloadService;

  Future<File> resolvePdfFile(CachedDers ders) async {
    final downloaded = await _downloadService.localPdfFile(ders.id);
    if (downloaded != null) return downloaded;

    final legacy = await _legacyPdfFile(ders.id);
    if (await legacy.exists()) return legacy;

    final pdfUrl = ders.pdfUrl;
    if (pdfUrl == null || pdfUrl.isEmpty) {
      throw StateError('No PDF available for this ders');
    }

    await legacy.parent.create(recursive: true);
    final response = await _dio.get<List<int>>(
      pdfUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Failed to download PDF');
    }

    await legacy.writeAsBytes(bytes, flush: true);
    return legacy;
  }

  Future<File> _legacyPdfFile(int dersId) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(p.join(directory.path, 'pdfs', 'ders_$dersId.pdf'));
  }
}
