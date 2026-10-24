import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

import 'billing_report_row.dart';

/// Period totals broken into the report's label/value lines.
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
            value: BillingFormat.money(totals.totalInvoiced, context),
            icon: Icons.receipt_long_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.collected'.tr(),
            value: BillingFormat.money(totals.collected, context),
            color: context.clinicStatusDone,
            icon: Icons.payments_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.expenses'.tr(),
            value: BillingFormat.money(totals.expenseTotal, context),
            color: context.clinicStatusUrgent,
            icon: Icons.wallet_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.purchases'.tr(),
            value: BillingFormat.money(totals.purchaseTotal, context),
            color: context.clinicStatusUrgent,
            icon: Icons.shopping_cart_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.payables'.tr(),
            value: BillingFormat.money(totals.purchasesDue, context),
            color: context.clinicStatusWaiting,
            icon: Icons.request_quote_outlined,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.net'.tr(),
            value: BillingFormat.money(totals.net, context),
            color: totals.net < 0
                ? context.errorColor
                : context.clinicStatusDone,
            icon: Icons.trending_up_rounded,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.remaining'.tr(),
            value: BillingFormat.money(totals.remaining, context),
            color: context.clinicStatusWaiting,
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.average'.tr(),
            value: BillingFormat.money(totals.averageInvoice, context),
          ),
          _divider(context),
          BillingReportRow(
            label: 'billing.report.collection_rate'.tr(),
            value: BillingFormat.percent(totals.collectionRate, context),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) =>
      Divider(height: 1, color: context.clinicBorder);
}
