import 'package:flutter/material.dart';

import '../../../../core/database/database.dart';
import '../home_utils.dart';

class UstazCard extends StatelessWidget {
  const UstazCard({
    super.key,
    required this.ustaz,
    required this.dersCount,
    this.onTap,
  });

  final CachedUstaze ustaz;
  final int dersCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
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
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                backgroundImage: ustaz.photoUrl != null
                    ? NetworkImage(ustaz.photoUrl!)
                    : null,
                child: ustaz.photoUrl == null
                    ? Text(
                        _initials(ustaz.name),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    : null,
              ),
              const SizedBox(height: 12),
              Text(
                ustaz.name,
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

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}
