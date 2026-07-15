import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../core/database/database.dart';
import '../../../core/network/dio_client.dart';

final pdfCacheServiceProvider = Provider<PdfCacheService>((ref) {
  return PdfCacheService(
    dio: ref.watch(dioProvider),
  );
});

class PdfCacheService {
  PdfCacheService({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<File> resolvePdfFile(CachedDers ders) async {
    final localFile = await _localPdfFile(ders.id);
    if (await localFile.exists()) {
      return localFile;
    }

    final pdfUrl = ders.pdfUrl;
    if (pdfUrl == null || pdfUrl.isEmpty) {
      throw StateError('No PDF available for this ders');
    }

    await localFile.parent.create(recursive: true);
    final response = await _dio.get<List<int>>(
      pdfUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Failed to download PDF');
    }

    await localFile.writeAsBytes(bytes, flush: true);
    return localFile;
  }

  Future<File> _localPdfFile(int dersId) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(p.join(directory.path, 'pdfs', 'ders_$dersId.pdf'));
  }
}
