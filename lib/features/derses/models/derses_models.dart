import '../../../core/database/database.dart';

enum DersDownloadStatus {
  none,
  partial,
  downloaded,
}

class EpisodeWithProgress {
  const EpisodeWithProgress({
    required this.episode,
    required this.isCompleted,
    required this.isDownloaded,
  });

  final CachedEpisode episode;
  final bool isCompleted;
  final bool isDownloaded;
}
