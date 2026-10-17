import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/billing/presentation/screens/billing_screen.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/layouts/app_shell_layout.dart';
import 'package:doctor_clinics_app/features/operations/presentation/screens/operation_screen.dart';
import 'package:doctor_clinics_app/features/patients/presentation/screens/patient_list_screen.dart';
import 'package:doctor_clinics_app/features/queue/presentation/screens/appointment_screen.dart';
import 'package:doctor_clinics_app/features/queue/presentation/screens/queue_screen.dart';

/// Primary destinations rendered inside the docked [AppShellLayout] shell.
///
/// Feed into `AppRouter.createRouter(extraShellRoutes: …)` so every nav item
/// stays inside the shell and keeps the side navigation visible.
List<RouteBase> buildAppShellRoutes() {
  return [
    _shellRoute(path: Routes.queue, name: 'queue', child: const QueueScreen()),
    _shellRoute(
      path: Routes.appointments,
      name: 'appointments',
      child: const AppointmentScreen(),
    ),
    _shellRoute(
      path: Routes.patients,
      name: 'patients',
      child: const PatientListScreen(),
    ),
    _shellRoute(
      path: Routes.operations,
      name: 'operations',
      child: const OperationScreen(),
    ),
    _shellRoute(
      path: Routes.billing,
      name: 'billing',
      child: const BillingScreen(),
    ),
  ];
}

GoRoute _shellRoute({
  required String path,
  required String name,
  required Widget child,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) =>
        fadeTransitionPage(AppShellLayout(child: child)),
  );
}
