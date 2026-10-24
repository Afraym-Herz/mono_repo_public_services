import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';

import 'billing_report_outstanding_card.dart';
import 'billing_report_summary_card.dart';

/// Period summary and outstanding-debt cards side by side when space allows.
class BillingReportTab extends StatelessWidget {
  const BillingReportTab({super.key, required this.overview});

  final BillingOverview overview;

  @override
  Widget build(BuildContext context) {
    final summary = BillingReportSummaryCard(totals: overview.totals);
    final outstanding = BillingReportOutstandingCard(totals: overview.totals);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < ResponsiveBreakpoints.mobileLarge) {
            return Column(children: [summary, outstanding]);
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: summary),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(child: outstanding),
            ],
          );
        },
      ),
    );
  }
}
