import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/queue_format.dart';

class QueuePaidPill extends StatelessWidget {
  const QueuePaidPill({super.key, required this.paidAmountPiasters});

  final int paidAmountPiasters;

  @override
  Widget build(BuildContext context) {
    final money = QueueFormat.money(paidAmountPiasters, context);
    final text = '${'queue_row.meta.paid'.tr()} — $money';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.clinicStatusDoneBg,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: AppColors.clinicStatusDoneBorder, width: 1.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: Dimensions.FONT_SIZE_SMALL.sp,
            color: AppColors.clinicStatusDone,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.clinicStatusDone,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
