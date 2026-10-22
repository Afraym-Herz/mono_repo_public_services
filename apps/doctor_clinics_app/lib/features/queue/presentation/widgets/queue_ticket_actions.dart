import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import '../cubit/queue_cubit.dart';
import '../helpers/queue_action_catalog.dart';
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
    final canManage = context.read<QueueCubit>().canManageQueue;
    final actions = QueueActionCatalog.visible(rowState, canManage: canManage);
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
                  ? context.clinicStatusUrgent
                  : context.clinicTextSecondary,
            ),
            tooltip: 'queue_row.status.urgent'.tr(),
            onPressed: isSubmitting ? null : onToggleUrgent,
          ),
        for (final action in actions)
          QueueActionButton(
            label: QueueActionCatalog.label(action),
            onPressed: () => onAction(action),
            isDanger: action == QueueAction.cancel,
            isSubmitting: isSubmitting,
          ),
      ],
    );
  }
}
