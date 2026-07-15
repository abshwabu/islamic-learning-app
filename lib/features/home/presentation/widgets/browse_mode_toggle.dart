import 'package:flutter/material.dart';

import '../../models/home_models.dart';

class BrowseModeToggle extends StatelessWidget {
  const BrowseModeToggle({
    super.key,
    required this.mode,
    required this.onChanged,
  });

  final HomeBrowseMode mode;
  final ValueChanged<HomeBrowseMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: SegmentedButton<HomeBrowseMode>(
        segments: const [
          ButtonSegment(
            value: HomeBrowseMode.ustaz,
            label: Text('By Ustaz'),
          ),
          ButtonSegment(
            value: HomeBrowseMode.topic,
            label: Text('By Topic'),
          ),
        ],
        selected: {mode},
        onSelectionChanged: (selection) => onChanged(selection.first),
      ),
    );
  }
}
