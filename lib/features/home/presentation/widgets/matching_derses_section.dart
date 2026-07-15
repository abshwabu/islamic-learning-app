import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/database/database.dart';
import '../../../../core/router/app_router.dart';

class MatchingDersesSection extends StatelessWidget {
  const MatchingDersesSection({super.key, required this.derses});

  final List<CachedDers> derses;

  @override
  Widget build(BuildContext context) {
    if (derses.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            'Matching Derses',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        ...derses.map(
          (ders) => ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: Text(ders.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(AppRoutes.dersEpisodesPath(ders.id)),
          ),
        ),
      ],
    );
  }
}
