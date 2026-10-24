import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/presentation/screens/operation_form_screen.dart';

/// Operation modals pushed outside the shell.
class OperationRoutes {
  const OperationRoutes._();

  static const String newOperation = 'operation-new';

  static String get newOperationPath => '${Routes.operations}/new';
}

/// Feed into `AppRouter.createRouter(extraRoutes: …)`.
List<RouteBase> buildOperationRoutes() {
  return [
    GoRoute(
      path: OperationRoutes.newOperationPath,
      name: OperationRoutes.newOperation,
      pageBuilder: (context, state) =>
          transparentModalRoutePage(const OperationFormScreen()),
    ),
  ];
}
