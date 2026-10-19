import 'package:easy_localization/easy_localization.dart';
// MVP-OFFLINE: restore for online (also firebase_core in pubspec.yaml)
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';

import 'package:doctor_clinics_app/app.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/dependency_injection/app_locator.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_store.dart';
import 'package:doctor_clinics_app/features/queue/data/demo/queue_demo_seeder.dart';

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
  setupAppLocator();

  // ---------------------------------------------------------------------------
  // TEMPORARY DEMO SEED
  // Loads the dummy clinic day (`assets/data/queue_patients.json`) and seeds it
  // into the local database when today is empty, so the home + queue widgets
  // render with content in the offline MVP. REVERT: drop these two calls, the
  // `lib/core/demo/` fixture, and `features/queue/data/demo/` once a real
  // source of patients exists.
  // ---------------------------------------------------------------------------
  await QueueDemoStore.instance.prime();
  await QueueDemoSeeder(
    patientDao: getIt<PatientDao>(),
    queueDao: getIt<QueueDao>(),
  ).seedIfEmpty();

  // ---------------------------------------------------------------------------
  // TEMPORARY AUTH BYPASS
  // Skips the login / first-run screens so the app boots straight into the
  // home shell. Seeds an authenticated session directly on [AppAuthCubit];
  // the router redirect (core `app_router_redirect.dart`) then lands on
  // Routes.home instead of Routes.login.
  //
  // REVERT: delete the `logIn(...)` call below and restore the original
  // `await getIt<AppAuthCubit>().checkAuthStatus();`.
  // ---------------------------------------------------------------------------
  getIt<AppAuthCubit>().logIn(
    const AuthUser(
      id: 'dev',
      name: 'Maha Adel',
      role: AppConstants.userRoleSecretary,
    ),
  );
  // await getIt<AppAuthCubit>().checkAuthStatus();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const DoctorClinicsApp(),
    ),
  );
}
