import 'package:agreements/core/utils/app_constants.dart';
import 'package:agreements/core/utils/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Hive-based fast cache layer.
///
/// Used for local caching such as settings and user preferences.
class HiveStorageService {
  // ─────────────────────────────────────────────────────
  // SINGLETON
  // ─────────────────────────────────────────────────────
  static HiveStorageService? _instance;
  static HiveStorageService get instance {
    _instance ??= HiveStorageService._internal();
    return _instance!;
  }

  HiveStorageService._internal();

  final Set<String> _openedBoxes = {};

  // ─────────────────────────────────────────────────────
  // INITIALISATION
  // ─────────────────────────────────────────────────────

  /// Call once at app start (from `initDependencies()`).
  Future<void> init() async {
    try {
      await Hive.initFlutter();

      // Pre-open essential boxes
      await openBox(AppConstants.settingsBox);

      AppLogger.success('Hive initialised');
    } catch (e) {
      AppLogger.error('Hive init failed: $e');
      rethrow;
    }
  }

  // ─────────────────────────────────────────────────────
  // BOX MANAGEMENT
  // ─────────────────────────────────────────────────────

  /// Open (or return already-open) box.
  Future<Box<T>> openBox<T>(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        _openedBoxes.add(boxName);
        return Hive.box<T>(boxName);
      }
      final box = await Hive.openBox<T>(boxName);
      _openedBoxes.add(boxName);
      return box;
    } catch (e) {
      AppLogger.error('Failed to open box "$boxName": $e');
      rethrow;
    }
  }

  /// Close all boxes (e.g. on logout).
  Future<void> closeAll() async {
    await Hive.close();
    _openedBoxes.clear();
    AppLogger.info('All Hive boxes closed');
  }

  // ─────────────────────────────────────────────────────
  // SETTINGS HELPERS
  // ─────────────────────────────────────────────────────

  Future<void> saveSetting(String key, dynamic value) async {
    final box = await openBox(AppConstants.settingsBox);
    await box.put(key, value);
  }

  Future<T?> getSetting<T>(String key) async {
    final box = await openBox(AppConstants.settingsBox);
    return box.get(key) as T?;
  }

  // ─────────────────────────────────────────────────────
  // GENERIC CRUD
  // ─────────────────────────────────────────────────────

  /// Put a value into a named box.
  Future<void> put<T>(String boxName, dynamic key, T value) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  /// Get a value from a named box.
  Future<T?> getValue<T>(String boxName, dynamic key) async {
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  /// Get all values from a named box.
  Future<List<T>> getAll<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    return box.values.toList();
  }

  /// Clear all data in a specific box.
  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
    AppLogger.info('Cleared box: $boxName');
  }
}
