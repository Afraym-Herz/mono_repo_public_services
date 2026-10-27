import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'billing_kpi_progress.dart';
import 'billing_report_row.dart';

/// Outstanding debt headline plus the collection-rate progress.
class BillingReportOutstandingCard extends StatelessWidget {
  const BillingReportOutstandingCard({super.key, required this.totals});

  final BillingTotals totals;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'billing.report.outstanding'.tr(),
      icon: Icons.account_balance_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResponsiveText(
            FinanceFormat.money(totals.outstanding, context),
            fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
            fontWeight: FontWeight.w700,
            color: context.clinicStatusUrgent,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          ResponsiveText(
            'billing.report.outstanding_hint'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          BillingReportRow(
            label: 'billing.report.debtors'.tr(),
            value: 'billing.report.debtors_value'.tr(
              namedArgs: {
                'count': FinanceFormat.number(totals.debtorCount, context),
              },
            ),
            icon: Icons.groups_outlined,
          ),
          Divider(height: 1, color: context.clinicBorder),
          BillingReportRow(
            label: 'billing.report.top_debt'.tr(),
            value: FinanceFormat.money(totals.topDebt, context),
            color: context.clinicStatusWaiting,
            icon: Icons.arrow_upward_rounded,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          ResponsiveText(
            'billing.report.collection_rate'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          BillingKpiProgress(
            value: totals.collectionRate,
            color: context.clinicStatusDone,
          ),
        ],
      ),
    );
  }
}
