import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_progress_bar.dart';
import 'home_stat_trend_pill.dart';

/// Patients card detail: the capacity progress bar with the day-over-day trend.
class HomeStatsPatientsFooter extends StatelessWidget {
  const HomeStatsPatientsFooter({super.key, this.fill = 0.62});

  /// Progress fill ratio in the `0.0`–`1.0` range.
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeStatTrendPill(label: 'home_stats_patients_trend'.tr()),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(child: HomeStatProgressBar(value: fill)),
      ],
    );
  }
}
