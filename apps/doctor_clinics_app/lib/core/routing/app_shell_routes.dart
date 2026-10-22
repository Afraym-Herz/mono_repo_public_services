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
///
/// App-level routing lives in `lib/core/routing/` (not `lib/features/`), the
/// app mirror of `package:core/src/routing/`. Screen widgets stay owned by
/// their features.
List<RouteBase> buildAppShellRoutes() {
  return [
    _shellRoute(path: Routes.queue, name: Routes.routeQueue, child: const QueueScreen()),
    _shellRoute(
      path: Routes.appointments,
      name: Routes.routeAppointments,
      child: const AppointmentScreen(),
    ),
    _shellRoute(
      path: Routes.patients,
      name: Routes.routePatients,
      child: const PatientListScreen(),
    ),
    _shellRoute(
      path: Routes.operations,
      name: Routes.routeOperations,
      child: const OperationScreen(),
    ),
    _shellRoute(
      path: Routes.billing,
      name: Routes.routeBilling,
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
