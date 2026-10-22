import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'screens/patient_profile_modal_screen.dart';

/// Patient detail modals (outside the shell) — see CLAUDE.md §5.
///
/// Feed into `AppRouter.createRouter(extraRoutes: …)`. A sibling of
/// `Routes.patients`, so the register stays visible behind the scrim.
List<RouteBase> buildPatientRoutes() {
  return [
    GoRoute(
      path: '${Routes.patients}/:patientId',
      name: Routes.routePatientProfile,
      pageBuilder: (context, state) => transparentModalRoutePage(
        PatientProfileModalScreen(
          patientId: int.tryParse(state.pathParameters['patientId'] ?? '') ?? 0,
        ),
      ),
    ),
  ];
}
