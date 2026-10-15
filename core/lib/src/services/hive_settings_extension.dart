import 'package:core/src/services/hive_storage_service.dart';
import 'package:core/src/utils/app_constants.dart';

/// Settings-box helpers for [HiveStorageService].
extension HiveSettingsExtension on HiveStorageService {
  Future<void> saveSetting(String key, dynamic value) async {
    final box = await openBox(AppConstants.settingsBox);
    await box.put(key, value);
  }

  Future<T?> getSetting<T>(String key) async {
    final box = await openBox(AppConstants.settingsBox);
    return box.get(key) as T?;
  }
}
