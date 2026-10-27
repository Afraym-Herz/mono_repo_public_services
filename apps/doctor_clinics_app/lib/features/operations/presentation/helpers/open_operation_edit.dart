import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/presentation/operation_routes.dart';

/// Opens the edit-operation modal over the current screen.
///
/// Returns `true` when the surgeon saved the changes, so the caller can show
/// the confirmation and refresh whatever board it owns.
Future<bool> openOperationEdit(BuildContext context, int operationId) async {
  final updated = await context.push<Operation>(
    OperationRoutes.editPath(operationId),
  );
  return updated != null;
}
