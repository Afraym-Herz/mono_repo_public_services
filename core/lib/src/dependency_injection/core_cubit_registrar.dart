import 'package:core/src/dependency_injection/setup_locator.dart';
import 'package:core/src/services/storage_service.dart';
import 'package:core/src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:core/src/shared_cubits/theme_cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Registers the shared core cubits (see `setup_locator.dart`).
void registerCoreCubits() {
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(sharedPreferences: getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<AppAuthCubit>(
    () => AppAuthCubit(secureStorage: getIt<SecureStorageService>()),
  );

  // TODO: once `AuthRepositoryImpl` exists (features/auth/data/...), register
  // it here: getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(...));
}
