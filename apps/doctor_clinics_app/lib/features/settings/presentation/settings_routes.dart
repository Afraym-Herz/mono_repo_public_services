import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/settings/presentation/screens/settings_modal_screen.dart';

/// Full-screen modal routes (outside the shell) — see CLAUDE.md §4.
///
/// Feed into `AppRouter.createRouter(extraRoutes: …)`.
List<RouteBase> buildSettingsRoutes() {
  return [
    GoRoute(
      path: Routes.settings,
      name: Routes.routeSettings,
      pageBuilder: (context, state) =>
          transparentModalRoutePage(const SettingsModalScreen()),
    ),
  ];
}
