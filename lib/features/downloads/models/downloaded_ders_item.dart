import '../../../core/database/database.dart';

class DownloadedDersItem {
  const DownloadedDersItem({
    required this.ders,
    required this.bytesUsed,
    required this.episodeCount,
    required this.hasPdf,
  });

  final CachedDers ders;
  final int bytesUsed;
  final int episodeCount;
  final bool hasPdf;
}
