import 'package:flutter/material.dart';

import '../../../../core/database/database.dart';
import '../home_utils.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    super.key,
    required this.topic,
    required this.dersCount,
    this.onTap,
  });

  final CachedTopic topic;
  final int dersCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = parseHexColor(topic.color) ??
        Theme.of(context).colorScheme.primary;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(
                  topicIconData(topic.icon),
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                topic.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                dersCountLabel(dersCount),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
