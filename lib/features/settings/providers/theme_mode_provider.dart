import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../models/app_settings_keys.dart';

final themeModeProvider =
    AsyncNotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

class ThemeModeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    final setting = await ref
        .read(databaseProvider)
        .settingsDao
        .getByKey(AppSettingsKeys.themeMode);
    return _fromSetting(setting?.value);
  }

  Future<void> setMode(ThemeMode mode) async {
    state = AsyncData(mode);
    await ref.read(databaseProvider).settingsDao.upsert(
          SettingsCompanion(
            key: const Value(AppSettingsKeys.themeMode),
            value: Value(_toSetting(mode)),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  static ThemeMode _fromSetting(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  static String _toSetting(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
  }
}
