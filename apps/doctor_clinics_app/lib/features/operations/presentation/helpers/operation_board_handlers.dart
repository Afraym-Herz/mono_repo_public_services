import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_confirm_dialog.dart';

/// Snackbar-returning handlers shared by the operation cards.
class OperationBoardHandlers {
  const OperationBoardHandlers._();

  static Future<void> toggleTest(
    BuildContext context,
    OperationEntry entry,
    OperationRequiredTest test,
  ) async {
    final error = await context.read<OperationBoardCubit>().toggleTest(
      entry,
      test,
    );
    if (!context.mounted) return;
    if (error != null) {
      AppSnackBar.showError(context, error);
      return;
    }
    AppSnackBar.showSuccess(
      context,
      'operations_board.feedback.test_updated'.tr(),
    );
  }

  static Future<void> complete(
    BuildContext context,
    OperationEntry entry,
  ) async {
    final confirmed = await OperationConfirmDialog.complete(
      context,
      entry.operation.name,
    );
    if (!confirmed || !context.mounted) return;
    final error = await context.read<OperationBoardCubit>().complete(entry);
    if (!context.mounted) return;
    if (error != null) {
      AppSnackBar.showError(context, error);
      return;
    }
    AppSnackBar.showSuccess(
      context,
      'operations_board.feedback.completed'.tr(),
    );
  }

  static Future<void> cancel(BuildContext context, OperationEntry entry) async {
    final confirmed = await OperationConfirmDialog.cancel(
      context,
      entry.operation.name,
    );
    if (!confirmed || !context.mounted) return;
    final error = await context.read<OperationBoardCubit>().cancel(entry);
    if (!context.mounted) return;
    if (error != null) {
      AppSnackBar.showError(context, error);
      return;
    }
    AppSnackBar.showSuccess(
      context,
      'operations_board.feedback.cancelled'.tr(),
    );
  }

  static void edit(BuildContext context) {
    AppSnackBar.showInfo(
      context,
      'operations_board.feedback.edit_unavailable'.tr(),
    );
  }
}
