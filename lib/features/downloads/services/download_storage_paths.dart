import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DownloadStoragePaths {
  Future<Directory> get _root async {
    final docs = await getApplicationDocumentsDirectory();
    final root = Directory(p.join(docs.path, 'downloads'));
    if (!await root.exists()) {
      await root.create(recursive: true);
    }
    return root;
  }

  Future<Directory> dersDirectory(int dersId) async {
    final root = await _root;
    final dir = Directory(p.join(root.path, 'ders_$dersId'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<File> episodeAudioFile(int dersId, int episodeId, String audioUrl) async {
    final dir = await dersDirectory(dersId);
    final extension = _extensionFromUrl(audioUrl) ?? 'mp3';
    return File(p.join(dir.path, 'episode_$episodeId.$extension'));
  }

  Future<File> dersPdfFile(int dersId) async {
    final dir = await dersDirectory(dersId);
    return File(p.join(dir.path, 'ders_$dersId.pdf'));
  }

  Future<int> directorySize(Directory directory) async {
    if (!await directory.exists()) return 0;
    var total = 0;
    await for (final entity in directory.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        total += await entity.length();
      }
    }
    return total;
  }

  String? _extensionFromUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;
    final ext = p.extension(uri.path).replaceFirst('.', '');
    if (ext.isEmpty || ext.length > 5) return null;
    return ext;
  }
}
