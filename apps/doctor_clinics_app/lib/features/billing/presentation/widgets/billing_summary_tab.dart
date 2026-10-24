import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';

import 'billing_kpi_cards.dart';
import 'billing_summary_ledger_card.dart';

/// Headline figures and the invoices & payments ledger for the selected
/// window.
class BillingSummaryTab extends StatelessWidget {
  const BillingSummaryTab({
    super.key,
    required this.overview,
    required this.query,
  });

  final BillingOverview overview;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BillingKpiCards(totals: overview.totals),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          Expanded(
            child: BillingSummaryLedgerCard(overview: overview, query: query),
          ),
        ],
      ),
    );
  }
}
