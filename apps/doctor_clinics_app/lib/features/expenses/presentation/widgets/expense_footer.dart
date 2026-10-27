import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Cancel and save actions of the expense editor.
class ExpenseFooter extends StatelessWidget {
  const ExpenseFooter({
    super.key,
    required this.saving,
    required this.onCancel,
    required this.onSave,
  });

  final bool saving;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.clinicBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'billing.expense_form.cancel'.tr(),
              outlined: true,
              height: Dimensions.CONTROL_HEIGHT.h,
              onPressed: onCancel,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            flex: 2,
            child: AppButton(
              label: 'billing.expense_form.save'.tr(),
              icon: Icons.save_outlined,
              height: Dimensions.CONTROL_HEIGHT.h,
              isLoading: saving,
              onPressed: saving ? null : onSave,
            ),
          ),
        ],
      ),
    );
  }
}
