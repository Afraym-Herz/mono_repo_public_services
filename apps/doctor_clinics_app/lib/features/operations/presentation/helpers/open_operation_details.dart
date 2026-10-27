import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/operation_routes.dart';

/// Opens the operation details modal over the board, then refreshes it.
///
/// The modal resolves its own copy of the row, so anything it changed (status,
/// checklist, edited fields) lands on the board behind it.
Future<void> openOperationDetails(BuildContext context, int operationId) async {
  await context.push<void>(OperationRoutes.detailsPath(operationId));
  if (context.mounted) await context.read<OperationBoardCubit>().load();
}
