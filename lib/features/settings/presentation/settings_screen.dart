import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../downloads/providers/wifi_only_provider.dart';
import '../providers/theme_mode_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final wifiOnlyAsync = ref.watch(wifiOnlyDownloadProvider);
    final wifiOnly = wifiOnlyAsync.maybeWhen(
      data: (value) => value,
      orElse: () => true,
    );

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
          const Divider(),
          const ListTile(
            title: Text('Downloads'),
            subtitle: Text('Control how offline content is fetched'),
          ),
          SwitchListTile(
            title: const Text('Download over Wi‑Fi only'),
            subtitle: const Text(
              'Block downloads on mobile data to save bandwidth',
            ),
            value: wifiOnly,
            onChanged: (value) {
              ref.read(wifiOnlyDownloadProvider.notifier).setEnabled(value);
            },
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
