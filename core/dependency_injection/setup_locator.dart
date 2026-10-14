import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Core Services
import 'package:agreements/core/network/network_info.dart';
import 'package:agreements/core/services/storage_service.dart';
import 'package:agreements/core/services/hive_storage_service.dart';
import 'package:agreements/core/services/print_service.dart';
import 'package:agreements/core/services/print_service_impl.dart';
import 'package:agreements/core/utils/logger.dart';

// Shared Cubits
import 'package:agreements/core/shared_cubits/theme_cubit/theme_cubit.dart';
import 'package:agreements/core/shared_cubits/app_auth_cubit/app_auth_cubit.dart';

// ═══════════════════════════════════════════════════════════════
// SERVICE LOCATOR
// ═══════════════════════════════════════════════════════════════

final GetIt getIt = GetIt.instance;

/// Initialises all dependencies in the correct order.
///
/// Call once from `main()` before `runApp()`.
///
/// As features get built, register their datasources/repositories/usecases/
/// cubits here too (grouped in their own `_registerXxxFeature()` helper,
/// mirroring `_registerCoreCubits()` below).
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
    // 3. CONNECTIVITY
    // ─────────────────────────────────────────────────────
    getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        connectionChecker: InternetConnectionChecker.createInstance(),
        connectivity: Connectivity(),
      ),
    );

    // ─────────────────────────────────────────────────────
    // 4. OTHER CORE SERVICES
    // ─────────────────────────────────────────────────────
    getIt.registerLazySingleton<PrintService>(() => const PrintServiceImpl());

    // ─────────────────────────────────────────────────────
    // 5. SHARED CUBITS
    // ─────────────────────────────────────────────────────
    _registerCoreCubits();

    AppLogger.success('All dependencies initialised successfully');
  } catch (e, stackTrace) {
    AppLogger.error('initDependencies failed: $e');
    if (kDebugMode) log('Stack trace: $stackTrace');
    rethrow;
  }
}

// ═══════════════════════════════════════════════════════════════
// SHARED CUBITS
// ═══════════════════════════════════════════════════════════════
void _registerCoreCubits() {
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(sharedPreferences: getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<AppAuthCubit>(
    () => AppAuthCubit(secureStorage: getIt<SecureStorageService>()),
  );

  // TODO: once `AuthRepositoryImpl` exists (features/auth/data/...), register
  // it here: getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(...));
}
