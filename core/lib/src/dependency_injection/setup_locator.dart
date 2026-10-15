import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
// MVP-OFFLINE: restore with network_info.dart + core/pubspec.yaml
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// Core Services
// MVP-OFFLINE: restore with network_info.dart + core/pubspec.yaml
// import 'package:core/src/network/network_info.dart';
import 'package:core/src/services/storage_service.dart';
import 'package:core/src/services/hive_storage_service.dart';
import 'package:core/src/services/print_service.dart';
import 'package:core/src/services/print_service_impl.dart';
import 'package:core/src/utils/logger.dart';

// Shared Cubits
import 'package:core/src/dependency_injection/core_cubit_registrar.dart';

// ═══════════════════════════════════════════════════════════════
// SERVICE LOCATOR
// ═══════════════════════════════════════════════════════════════

final GetIt getIt = GetIt.instance;

/// Initialises all dependencies in the correct order.
///
/// Call once from `main()` before `runApp()`.
///
/// As features get built, register their datasources/repositories/usecases/
/// cubits here too (grouped in their own `registerXxxFeature()` helper,
/// mirroring `registerCoreCubits()` in `core_cubit_registrar.dart`).
Future<void> initDependencies() async {
  try {
    // ─────────────────────────────────────────────────────
    // 1. CORE SINGLETONS (synchronous)
    // ─────────────────────────────────────────────────────
    getIt.registerSingleton<SecureStorageService>(SecureStorageService());

    // ─────────────────────────────────────────────────────
    // 2. ASYNC SINGLETONS
    // ─────────────────────────────────────────────────────
    getIt.registerSingletonAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      AppLogger.success('SharedPreferences initialised');
      return prefs;
    });

    getIt.registerSingletonAsync<HiveStorageService>(() async {
      final hiveService = HiveStorageService.instance;
      await hiveService.init();
      AppLogger.success('HiveStorageService initialised');
      return hiveService;
    });

    // Wait for all async singletons
    await getIt.allReady();

    // ─────────────────────────────────────────────────────
    // 3. CONNECTIVITY — MVP-OFFLINE: commented out (offline-only MVP).
    //    Restore with network_info.dart + core/pubspec.yaml.
    // ─────────────────────────────────────────────────────
    // getIt.registerLazySingleton<NetworkInfo>(
    //   () => NetworkInfoImpl(
    //     connectionChecker: InternetConnectionChecker.createInstance(),
    //     connectivity: Connectivity(),
    //   ),
    // );

    // ─────────────────────────────────────────────────────
    // 4. OTHER CORE SERVICES
    // ─────────────────────────────────────────────────────
    getIt.registerLazySingleton<PrintService>(() => const PrintServiceImpl());

    // ─────────────────────────────────────────────────────
    // 5. SHARED CUBITS
    // ─────────────────────────────────────────────────────
    registerCoreCubits();

    AppLogger.success('All dependencies initialised successfully');
  } catch (e, stackTrace) {
    AppLogger.error('initDependencies failed: $e');
    if (kDebugMode) log('Stack trace: $stackTrace');
    rethrow;
  }
}
