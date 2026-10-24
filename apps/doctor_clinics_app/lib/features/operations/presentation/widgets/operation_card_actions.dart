import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Footer actions of an expanded operation card.
class OperationCardActions extends StatelessWidget {
  const OperationCardActions({
    super.key,
    required this.entry,
    required this.onComplete,
    required this.onCancel,
    required this.onEdit,
  });

  final OperationEntry entry;
  final VoidCallback onComplete;
  final VoidCallback onCancel;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final isScheduled =
        entry.operation.status == AppConstants.operationStatusScheduled;
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      children: [
        if (isScheduled)
          AppButton(
            label: 'operations_board.actions.complete'.tr(),
            icon: Icons.task_alt_rounded,
            width: 220.w,
            height: 40.h,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            iconSize: Dimensions.ICON_SIZE_SMALL.r,
            color: context.successColor,
            onPressed: onComplete,
          ),
        if (isScheduled)
          AppButton(
            label: 'operations_board.actions.cancel'.tr(),
            icon: Icons.cancel_outlined,
            width: 200.w,
            height: 40.h,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            iconSize: Dimensions.ICON_SIZE_SMALL.r,
            outlined: true,
            textColor: context.clinicActionDanger,
            borderColor: context.clinicActionDanger,
            onPressed: onCancel,
          ),
        AppButton(
          label: 'operations_board.actions.edit'.tr(),
          icon: Icons.edit_outlined,
          width: 150.w,
          height: 40.h,
          fontSize: Dimensions.FONT_SIZE_SMALL,
          iconSize: Dimensions.ICON_SIZE_SMALL.r,
          outlined: true,
          onPressed: onEdit,
        ),
      ],
    );
  }
}
