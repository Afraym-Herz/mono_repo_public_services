import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'queue_summary_icon_chip.dart';

/// Fallback shown when no patient is in consultation.
class QueueSummaryCurrentEmpty extends StatelessWidget {
  const QueueSummaryCurrentEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QueueSummaryIconChip(
          icon: Icons.medical_services_outlined,
          color: context.clinicPrimary,
          filled: true,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'queue_summary.current_title'.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                  color: context.clinicTextSecondary,
                ),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              Text(
                'queue_summary.current_empty'.tr(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.clinicTextSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
