enum DownloadFileKind { pdf, episode }

class DownloadFileProgress {
  const DownloadFileProgress({
    required this.key,
    required this.label,
    required this.kind,
    this.episodeId,
    this.receivedBytes = 0,
    this.totalBytes = 0,
    this.status = DownloadFileStatus.pending,
    this.errorMessage,
  });

  final String key;
  final String label;
  final DownloadFileKind kind;
  final int? episodeId;
  final int receivedBytes;
  final int totalBytes;
  final DownloadFileStatus status;
  final String? errorMessage;

  double get fraction {
    if (totalBytes <= 0) return 0;
    return (receivedBytes / totalBytes).clamp(0.0, 1.0);
  }

  DownloadFileProgress copyWith({
    int? receivedBytes,
    int? totalBytes,
    DownloadFileStatus? status,
    String? errorMessage,
  }) {
    return DownloadFileProgress(
      key: key,
      label: label,
      kind: kind,
      episodeId: episodeId,
      receivedBytes: receivedBytes ?? this.receivedBytes,
      totalBytes: totalBytes ?? this.totalBytes,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}

enum DownloadFileStatus {
  pending,
  downloading,
  completed,
  failed,
  skipped,
}

class DersDownloadProgress {
  const DersDownloadProgress({
    required this.dersId,
    this.files = const [],
    this.isRunning = false,
    this.errorMessage,
  });

  final int dersId;
  final List<DownloadFileProgress> files;
  final bool isRunning;
  final String? errorMessage;

  int get completedCount =>
      files.where((f) => f.status == DownloadFileStatus.completed).length;

  int get totalCount => files.length;

  double get overallFraction {
    if (files.isEmpty) return 0;
    final sum = files.fold<double>(0, (total, file) {
      if (file.status == DownloadFileStatus.completed) return total + 1;
      if (file.status == DownloadFileStatus.downloading) return total + file.fraction;
      return total;
    });
    return (sum / files.length).clamp(0.0, 1.0);
  }

  DownloadFileProgress? get currentFile {
    for (final file in files) {
      if (file.status == DownloadFileStatus.downloading) return file;
    }
    return null;
  }

  DersDownloadProgress copyWith({
    List<DownloadFileProgress>? files,
    bool? isRunning,
    String? errorMessage,
    bool clearError = false,
  }) {
    return DersDownloadProgress(
      dersId: dersId,
      files: files ?? this.files,
      isRunning: isRunning ?? this.isRunning,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
