import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Confirmation for the two irreversible operation actions.
class OperationConfirmDialog {
  const OperationConfirmDialog._();

  /// Returns `true` when the surgeon confirms completing the operation.
  static Future<bool> complete(BuildContext context, String name) async {
    return _show(
      context,
      title: 'operations_board.actions.complete_title'.tr(),
      body: 'operations_board.actions.complete_body'.tr(
        namedArgs: {'name': name},
      ),
      confirm: 'operations_board.actions.complete'.tr(),
    );
  }

  /// Returns `true` when the surgeon confirms cancelling the operation.
  static Future<bool> cancel(BuildContext context, String name) async {
    return _show(
      context,
      title: 'operations_board.actions.cancel_title'.tr(),
      body: 'operations_board.actions.cancel_body'.tr(
        namedArgs: {'name': name},
      ),
      confirm: 'operations_board.actions.cancel'.tr(),
      isDanger: true,
    );
  }

  static Future<bool> _show(
    BuildContext context, {
    required String title,
    required String body,
    required String confirm,
    bool isDanger = false,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => CustomDialog(
        icon: isDanger ? Icons.warning_amber_rounded : Icons.task_alt_rounded,
        title: title,
        description: body,
        isFailed: isDanger,
        onTapFalse: () => Navigator.pop(dialogContext, false),
        onTapTrue: () => Navigator.pop(dialogContext, true),
        onTapFalseText: 'operations_board.actions.keep'.tr(),
        onTapTrueText: confirm,
      ),
    );
    return confirmed ?? false;
  }
}
