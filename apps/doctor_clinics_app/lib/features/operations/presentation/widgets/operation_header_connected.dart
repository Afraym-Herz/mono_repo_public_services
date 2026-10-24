import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/operation_routes.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_header.dart';

/// Banner wired to the board count and the app-level quick actions.
class OperationHeaderConnected extends StatelessWidget {
  const OperationHeaderConnected({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select<OperationBoardCubit, int>(
      (cubit) => cubit.state.maybeMap(
        loaded: (state) => state.entries.length,
        orElse: () => 0,
      ),
    );
    return OperationHeader(
      operationCount: count,
      onDashboard: () => context.go(Routes.home),
      onBackup: () => _showUnavailable(
        context,
        'operations_board.header.backup_unavailable',
      ),
      onNewOperation: () => _newOperation(context),
    );
  }

  Future<void> _newOperation(BuildContext context) async {
    final created = await context.push<Operation>(
      OperationRoutes.newOperationPath,
    );
    if (created == null || !context.mounted) return;
    AppSnackBar.showSuccess(context, 'operation_form.saved'.tr());
    context.read<OperationBoardCubit>().load(keepExpandedId: created.id);
  }

  void _showUnavailable(BuildContext context, String key) {
    AppSnackBar.showInfo(context, key.tr());
  }
}
