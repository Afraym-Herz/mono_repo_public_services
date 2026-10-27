import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/presentation/screens/operation_details_screen.dart';
import 'package:doctor_clinics_app/features/operations/presentation/screens/operation_edit_screen.dart';
import 'package:doctor_clinics_app/features/operations/presentation/screens/operation_form_screen.dart';

/// Operation modals pushed outside the shell — see CLAUDE.md §5.
class OperationRoutes {
  const OperationRoutes._();

  static const String newOperation = 'operation-new';
  static const String operationDetails = 'operation-details';
  static const String operationEdit = 'operation-edit';

  static String get newOperationPath => '${Routes.operations}/new';

  /// Path pattern + builder helper for one operation's details modal.
  static const String detailsPathPattern = '${Routes.operations}/:operationId';

  /// Path pattern + builder helper for one operation's edit modal.
  static const String editPathPattern =
      '${Routes.operations}/:operationId/edit';

  static String detailsPath(int operationId) =>
      '${Routes.operations}/$operationId';

  static String editPath(int operationId) =>
      '${Routes.operations}/$operationId/edit';
}

/// Feed into `AppRouter.createRouter(extraRoutes: …)`.
///
/// The literal `new` route is registered before the `:operationId` siblings so
/// `/operations/new` is never swallowed by the parameterised pattern.
List<RouteBase> buildOperationRoutes() {
  return [
    GoRoute(
      path: OperationRoutes.newOperationPath,
      name: OperationRoutes.newOperation,
      pageBuilder: (context, state) =>
          transparentModalRoutePage(const OperationFormScreen()),
    ),
    GoRoute(
      path: OperationRoutes.editPathPattern,
      name: OperationRoutes.operationEdit,
      pageBuilder: (context, state) => transparentModalRoutePage(
        OperationEditScreen(
          operationId: _id(state.pathParameters['operationId']),
        ),
      ),
    ),
    GoRoute(
      path: OperationRoutes.detailsPathPattern,
      name: OperationRoutes.operationDetails,
      pageBuilder: (context, state) => transparentModalRoutePage(
        OperationDetailsScreen(
          operationId: _id(state.pathParameters['operationId']),
        ),
      ),
    ),
  ];
}

int _id(String? value) => int.tryParse(value ?? '') ?? 0;
