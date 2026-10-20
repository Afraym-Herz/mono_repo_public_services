import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_row_format.dart';

/// Pill for the account column: green when settled, red with the balance due.
class PatientBalanceBadge extends StatelessWidget {
  const PatientBalanceBadge({super.key, required this.debtPiasters});

  final int debtPiasters;

  @override
  Widget build(BuildContext context) {
    final isPaid = debtPiasters <= 0;
    final foreground = isPaid
        ? AppColors.clinicStatusDone
        : AppColors.clinicStatusUrgent;
    final background = isPaid
        ? AppColors.clinicStatusDoneBg
        : AppColors.clinicStatusUrgentBg;
    final border = isPaid
        ? AppColors.clinicStatusDoneBorder
        : AppColors.clinicStatusUrgentBorder;
    final label = isPaid
        ? 'patients.table.paid_full'.tr()
        : 'patients.table.remaining'.tr(
            namedArgs: {
              'amount': PatientRowFormat.money(debtPiasters, context),
            },
          );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: border, width: 1.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPaid ? Icons.check_circle_outline : Icons.error_outline,
            size: Dimensions.FONT_SIZE_SMALL.sp,
            color: foreground,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
          Flexible(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w600,
              color: foreground,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
