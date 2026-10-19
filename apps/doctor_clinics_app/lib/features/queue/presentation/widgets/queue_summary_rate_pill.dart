import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_summary_data.dart';

/// Waiting-health capsule under today's registration total.
class QueueSummaryRatePill extends StatelessWidget {
  const QueueSummaryRatePill({super.key, required this.rating});

  final QueueWaitRating rating;

  @override
  Widget build(BuildContext context) {
    final color = switch (rating) {
      QueueWaitRating.excellent => AppColors.clinicStatusDone,
      QueueWaitRating.good => AppColors.clinicStatusWaiting,
      QueueWaitRating.high => AppColors.clinicStatusUrgent,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.clinicIsDark ? 0.18 : 0.10),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.trending_up_rounded,
            size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
            color: color,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
          Text(
            'queue_summary.wait_rate'.tr(
              namedArgs: {'rating': rating.labelKey.tr()},
            ),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: Dimensions.FONT_SIZE_SMALL.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
