import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_card.dart';
import 'home_stats_examined_footer.dart';
import 'home_stats_grid.dart';
import 'home_stats_patients_footer.dart';
import 'home_stats_revenue_footer.dart';
import 'home_stats_waiting_footer.dart';

/// Top-of-canvas KPI strip on the home dashboard: today's patients, the cases
/// still waiting, the consultations already examined, and the day's revenue.
///
/// The four tiles all reuse [HomeStatCard] and supply their own footer content.
/// The figures are still localized placeholders (mirroring the appointments
/// alert) — they will read from the appointments/billing feeds once those
/// features land.
class HomeStatsRow extends StatelessWidget {
  const HomeStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
      ),
      child: HomeStatsGrid(
        cards: [
          HomeStatCard(
            title: 'home_stats_patients_title'.tr(),
            icon: Icons.groups_2_outlined,
            value: 'home_stats_patients_value'.tr(),
            subtitle: 'home_stats_patients_label'.tr(),
            animationDelay: const Duration(milliseconds: 160),
            footer: const HomeStatsPatientsFooter(),
          ),
          HomeStatCard(
            title: 'home_stats_waiting_title'.tr(),
            icon: Icons.hourglass_empty_rounded,
            value: 'home_stats_waiting_value'.tr(),
            subtitle: 'home_stats_waiting_label'.tr(),
            iconColor: context.infoColor,
            animationDelay: const Duration(milliseconds: 230),
            footer: const HomeStatsWaitingFooter(),
          ),
          HomeStatCard(
            title: 'home_stats_examined_title'.tr(),
            icon: Icons.check_circle_outline_rounded,
            value: 'home_stats_examined_value'.tr(),
            subtitle: 'home_stats_examined_label'.tr(),
            iconColor: context.successColor,
            animationDelay: const Duration(milliseconds: 300),
            footer: const HomeStatsExaminedFooter(),
          ),
          HomeStatCard(
            title: 'home_stats_revenue_title'.tr(),
            icon: Icons.account_balance_wallet_outlined,
            value: 'home_stats_revenue_value'.tr(),
            unit: 'home_stats_currency'.tr(),
            animationDelay: const Duration(milliseconds: 370),
            footer: const HomeStatsRevenueFooter(),
          ),
        ],
      ),
    );
  }
}
