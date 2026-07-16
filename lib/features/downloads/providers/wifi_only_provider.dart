import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../settings/models/app_settings_keys.dart';

const wifiOnlySettingKey = AppSettingsKeys.downloadWifiOnly;

final wifiOnlyDownloadProvider =
    AsyncNotifierProvider<WifiOnlyDownloadNotifier, bool>(
  WifiOnlyDownloadNotifier.new,
);

class WifiOnlyDownloadNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final setting =
        await ref.read(databaseProvider).settingsDao.getByKey(wifiOnlySettingKey);
    // Default to WiFi-only for safer mobile data usage.
    if (setting == null) return true;
    return setting.value == 'true';
  }

  Future<void> setEnabled(bool enabled) async {
    state = AsyncData(enabled);
    await ref.read(databaseProvider).settingsDao.upsert(
          SettingsCompanion(
            key: const Value(wifiOnlySettingKey),
            value: Value(enabled ? 'true' : 'false'),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }
}

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService(Connectivity());
});

class ConnectivityService {
  ConnectivityService(this._connectivity);

  final Connectivity _connectivity;

  Future<bool> isOnWifi() async {
    final results = await _connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.wifi);
  }

  Future<bool> canDownload({required bool wifiOnly}) async {
    if (!wifiOnly) return true;
    return isOnWifi();
  }
}
