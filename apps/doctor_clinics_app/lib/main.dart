import 'package:easy_localization/easy_localization.dart';
// MVP-OFFLINE: restore for online (also firebase_core in pubspec.yaml)
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';

import 'app.dart';

/// Entry point for the Doctor Clinics app.
///
/// Thin bootstrap only — all reusable logic lives in `package:core`.
/// Feature code lives under `lib/features/` of THIS app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  // MVP-OFFLINE: Firebase init commented out (offline-only MVP).
  // try {
  //   await Firebase.initializeApp();
  // } catch (e) {
  //   AppLogger.warning('Firebase init skipped: $e');
  // }

  await initDependencies();
  await getIt<AppAuthCubit>().checkAuthStatus();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const DoctorClinicsApp(),
    ),
  );
}
