import 'package:flutter/material.dart';

import '../../models/derses_models.dart';

class DownloadStatusBadge extends StatelessWidget {
  const DownloadStatusBadge({super.key, required this.status});

  final DersDownloadStatus status;

  @override
  Widget build(BuildContext context) {
    if (status == DersDownloadStatus.none) {
      return const SizedBox.shrink();
    }

    final isDownloaded = status == DersDownloadStatus.downloaded;
    final color = isDownloaded ? Colors.green : Colors.orange;
    final label = isDownloaded ? 'Downloaded' : 'Partial';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDownloaded ? Icons.download_done : Icons.downloading,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
