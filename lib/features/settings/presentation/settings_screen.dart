import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../downloads/providers/wifi_only_provider.dart';
import '../../favorites/providers/favorites_providers.dart';
import '../../home/models/home_models.dart';
import '../../home/providers/home_providers.dart';
import '../providers/default_playback_speed_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../services/clear_local_data_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider).maybeWhen(
          data: (value) => value,
          orElse: () => ThemeMode.system,
        );
    final browseMode = ref.watch(homeBrowseModeProvider).maybeWhen(
          data: (value) => value,
          orElse: () => HomeBrowseMode.ustaz,
        );
    final wifiOnly = ref.watch(wifiOnlyDownloadProvider).maybeWhen(
          data: (value) => value,
          orElse: () => true,
        );
    final playbackSpeed = ref.watch(defaultPlaybackSpeedProvider).maybeWhen(
          data: (value) => value,
          orElse: () => 1.0,
        );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const _SectionHeader(
            title: 'Home',
            subtitle: 'Default browse mode on the home screen',
          ),
          RadioGroup<HomeBrowseMode>(
            groupValue: browseMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(homeBrowseModeProvider.notifier).setMode(value);
              }
            },
            child: Column(
              children: [
                RadioListTile<HomeBrowseMode>(
                  title: const Text('By Ustaz'),
                  value: HomeBrowseMode.ustaz,
                ),
                RadioListTile<HomeBrowseMode>(
                  title: const Text('By Topic'),
                  value: HomeBrowseMode.topic,
                ),
              ],
            ),
          ),
          const Divider(),
          const _SectionHeader(
            title: 'Appearance',
            subtitle: 'Choose your preferred theme',
          ),
          RadioGroup<ThemeMode>(
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeProvider.notifier).setMode(value);
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
          const _SectionHeader(
            title: 'Playback',
            subtitle: 'Default speed when starting an episode',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 8,
              children: defaultPlaybackSpeeds.map((speed) {
                final selected = playbackSpeed == speed;
                return ChoiceChip(
                  label: Text('${speed}x'),
                  selected: selected,
                  onSelected: (_) {
                    ref
                        .read(defaultPlaybackSpeedProvider.notifier)
                        .setSpeed(speed);
                  },
                );
              }).toList(),
            ),
          ),
          const Divider(),
          const _SectionHeader(
            title: 'Downloads',
            subtitle: 'Control how offline content is fetched',
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
          const Divider(),
          const _SectionHeader(
            title: 'Data',
            subtitle: 'Manage local user data on this device',
          ),
          ListTile(
            leading: Icon(
              Icons.delete_forever_outlined,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Clear all local data',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            subtitle: const Text(
              'Removes progress, favorites, and downloads. Cached ders content stays.',
            ),
            onTap: () => _confirmClearLocalData(context, ref),
          ),
          const SizedBox(height: 24),
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

  Future<void> _confirmClearLocalData(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear all local data?'),
        content: const Text(
          'This permanently deletes playback progress, favorites, and all '
          'downloaded PDFs and audio files. Your theme and other settings are kept.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear data'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await ref.read(clearLocalDataServiceProvider).clearUserData();
    invalidateAfterClearLocalData(ref);
    ref.invalidate(favoriteDersesProvider);
    ref.invalidate(favoriteEpisodesProvider);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Local data cleared')),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
