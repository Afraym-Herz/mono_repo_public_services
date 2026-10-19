import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Revenue card detail: the cash / visa payment breakdown.
class HomeStatsRevenueFooter extends StatelessWidget {
  const HomeStatsRevenueFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.clinicTextSecondary;
    return Row(
      children: [
        Flexible(
          child: ResponsiveText(
            'home_stats_revenue_cash'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: color,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w / 2,
          ),
          child: ResponsiveText(
            '•',
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: color,
          ),
        ),
        Expanded(
          child: ResponsiveText(
            'home_stats_revenue_visa'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: color,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
