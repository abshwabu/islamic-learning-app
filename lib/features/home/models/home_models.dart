import '../../../core/database/database.dart';

class ContinueListeningItem {
  const ContinueListeningItem({
    required this.progress,
    required this.episode,
    required this.ders,
  });

  final PlaybackProgress progress;
  final CachedEpisode episode;
  final CachedDers ders;

  double get progressFraction {
    if (episode.durationSeconds <= 0) return 0;
    return (progress.positionSeconds / episode.durationSeconds).clamp(0.0, 1.0);
  }
}

enum HomeBrowseMode {
  ustaz,
  topic;

  static HomeBrowseMode fromSetting(String? value) {
    return value == 'topic' ? HomeBrowseMode.topic : HomeBrowseMode.ustaz;
  }

  String get settingValue => this == HomeBrowseMode.topic ? 'topic' : 'ustaz';

  String get label => this == HomeBrowseMode.topic ? 'By Topic' : 'By Ustaz';
}
