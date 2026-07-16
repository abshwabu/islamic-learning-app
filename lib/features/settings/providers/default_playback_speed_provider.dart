import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../models/app_settings_keys.dart';

const defaultPlaybackSpeeds = [0.75, 1.0, 1.25, 1.5, 2.0];

final defaultPlaybackSpeedProvider =
    AsyncNotifierProvider<DefaultPlaybackSpeedNotifier, double>(
  DefaultPlaybackSpeedNotifier.new,
);

class DefaultPlaybackSpeedNotifier extends AsyncNotifier<double> {
  @override
  Future<double> build() async {
    final setting = await ref
        .read(databaseProvider)
        .settingsDao
        .getByKey(AppSettingsKeys.defaultPlaybackSpeed);
    final parsed = double.tryParse(setting?.value ?? '');
    if (parsed == null) return 1.0;
    if (!defaultPlaybackSpeeds.contains(parsed)) return 1.0;
    return parsed;
  }

  Future<void> setSpeed(double speed) async {
    state = AsyncData(speed);
    await ref.read(databaseProvider).settingsDao.upsert(
          SettingsCompanion(
            key: const Value(AppSettingsKeys.defaultPlaybackSpeed),
            value: Value(speed.toString()),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }
}
