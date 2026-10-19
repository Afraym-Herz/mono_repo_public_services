import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import '../helpers/queue_row_state.dart';
import 'queue_action_button.dart';

class QueueTicketActions extends StatelessWidget {
  const QueueTicketActions({
    super.key,
    required this.rowState,
    required this.onAction,
    this.isSubmitting = false,
    this.isUrgent = false,
    this.onToggleUrgent,
  });

  final QueueRowState rowState;
  final ValueChanged<QueueAction> onAction;
  final bool isSubmitting;
  final bool isUrgent;
  final VoidCallback? onToggleUrgent;

  @override
  Widget build(BuildContext context) {
    final actions = rowState.availableActions;
    if (actions.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (onToggleUrgent != null)
          IconButton(
            icon: Icon(
              isUrgent ? Icons.flag : Icons.flag_outlined,
              size: Dimensions.ICON_SIZE_SMALL.sp,
              color: isUrgent
                  ? AppColors.clinicStatusUrgent
                  : AppColors.clinicTextSecondary,
            ),
            tooltip: 'queue_row.status.urgent'.tr(),
            onPressed: isSubmitting ? null : onToggleUrgent,
          ),
        for (final action in actions)
          QueueActionButton(
            label: _labelFor(action),
            onPressed: () => onAction(action),
            isDanger: action == QueueAction.cancel,
            isSubmitting: isSubmitting,
          ),
      ],
    );
  }

  String _labelFor(QueueAction action) {
    switch (action) {
      case QueueAction.checkIn:
        return 'queue_row.action.check_in'.tr();
      case QueueAction.call:
        return 'queue_row.action.call'.tr();
      case QueueAction.advance:
        return 'queue_row.action.advance'.tr();
      case QueueAction.cancel:
        return 'queue_row.action.cancel'.tr();
      case QueueAction.restore:
        return 'queue_row.action.restore'.tr();
      case QueueAction.finish:
        return 'queue_row.action.finish'.tr();
      case QueueAction.collect:
        return 'queue_row.action.collect'.tr();
      case QueueAction.toggleUrgent:
        return 'queue_row.status.urgent'.tr();
    }
  }
}
