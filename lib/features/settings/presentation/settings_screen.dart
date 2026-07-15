import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_mode_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Appearance'),
            subtitle: Text('Choose your preferred theme'),
          ),
          RadioGroup<ThemeMode>(
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeProvider.notifier).state = value;
              }
            },
            child: Column(
              children: ThemeMode.values.map((mode) {
                return RadioListTile<ThemeMode>(
                  title: Text(_themeModeLabel(mode)),
                  value: mode,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  String _themeModeLabel(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => 'System',
      ThemeMode.light => 'Light',
      ThemeMode.dark => 'Dark',
    };
  }
}
