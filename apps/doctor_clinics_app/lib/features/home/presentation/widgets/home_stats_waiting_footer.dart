import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Waiting card detail: the average wait time paired with the info status dot.
class HomeStatsWaitingFooter extends StatelessWidget {
  const HomeStatsWaitingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ResponsiveText(
            'home_stats_waiting_average'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Container(
          width: Dimensions.ICON_SIZE_VERY_SMALL.r,
          height: Dimensions.ICON_SIZE_VERY_SMALL.r,
          decoration: const BoxDecoration(
            color: AppColors.info,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
