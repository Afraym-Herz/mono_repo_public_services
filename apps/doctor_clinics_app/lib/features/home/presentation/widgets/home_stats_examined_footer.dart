import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Examined card detail: the completion-rate label and its percentage.
class HomeStatsExaminedFooter extends StatelessWidget {
  const HomeStatsExaminedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ResponsiveText(
            'home_stats_examined_rate_label'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ResponsiveText(
          'home_stats_examined_rate_value'.tr(),
          fontSize: Dimensions.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w700,
          color: AppColors.success,
          maxLines: 1,
        ),
      ],
    );
  }
}
