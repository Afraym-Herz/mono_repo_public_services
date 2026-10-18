import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Compact "live" pill rendered beside the queue title.
class QueueLiveBadge extends StatelessWidget {
  const QueueLiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: ResponsiveText(
        'queue_header.live'.tr(),
        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
        responsive: false,
        fontWeight: FontWeight.w600,
        color: context.clinicPrimary,
      ),
    );
  }
}
