import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';

import 'billing_report_row.dart';

/// Revenue totals broken into the report's label/value lines.
class BillingReportSummaryCard extends StatelessWidget {
  const BillingReportSummaryCard({super.key, required this.totals});

  final BillingTotals totals;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'billing.report.summary'.tr(),
      icon: Icons.summarize_outlined,
      child: Column(
        children: [
          BillingReportRow(
            label: 'billing.report.invoiced'.tr(),
            value: FinanceFormat.money(totals.totalInvoiced, context),
            icon: Icons.receipt_long_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.collected'.tr(),
            value: FinanceFormat.money(totals.collected, context),
            color: context.clinicStatusDone,
            icon: Icons.payments_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.remaining'.tr(),
            value: FinanceFormat.money(totals.remaining, context),
            color: context.clinicStatusWaiting,
            icon: Icons.pending_actions_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.average'.tr(),
            value: FinanceFormat.money(totals.averageInvoice, context),
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.collection_rate'.tr(),
            value: FinanceFormat.percent(totals.collectionRate, context),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) =>
      Divider(height: 1, color: context.clinicBorder);
}
