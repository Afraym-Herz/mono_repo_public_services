import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

import 'billing_kpi_card.dart';
import 'billing_kpi_grid.dart';

/// The four headline figures at the top of the summary tab.
class BillingKpiCards extends StatelessWidget {
  const BillingKpiCards({super.key, required this.totals});

  final BillingTotals totals;

  @override
  Widget build(BuildContext context) {
    final currency = 'billing.currency'.tr();
    String count(String key, int value) =>
        key.tr(namedArgs: {'count': BillingFormat.number(value, context)});
    String percent(String key, double value) =>
        key.tr(namedArgs: {'percent': BillingFormat.percent(value, context)});
    return BillingKpiGrid(
      cards: [
        BillingKpiCard(
          title: 'billing.kpi.invoiced'.tr(),
          icon: Icons.receipt_long_rounded,
          value: BillingFormat.amount(totals.totalInvoiced, context),
          unit: currency,
          subtitle: count('billing.kpi.invoice_count', totals.invoiceCount),
          iconColor: context.clinicStatusBooked,
          progress: totals.collectionRate,
        ),
        BillingKpiCard(
          title: 'billing.kpi.collected'.tr(),
          icon: Icons.payments_rounded,
          value: BillingFormat.amount(totals.collected, context),
          unit: currency,
          subtitle: percent(
            'billing.kpi.collection_rate',
            totals.collectionRate,
          ),
          iconColor: context.clinicStatusDone,
          progress: totals.collectionRate,
          animationDelay: const Duration(milliseconds: 80),
        ),
        BillingKpiCard(
          title: 'billing.kpi.expenses'.tr(),
          icon: Icons.account_balance_wallet_rounded,
          value: BillingFormat.amount(totals.outflowTotal, context),
          unit: currency,
          subtitle: count('billing.kpi.outflow_count', totals.outflowCount),
          iconColor: context.clinicStatusUrgent,
          progress: totals.expenseRatio,
          animationDelay: const Duration(milliseconds: 160),
        ),
        BillingKpiCard(
          title: 'billing.kpi.net'.tr(),
          icon: Icons.trending_up_rounded,
          value: BillingFormat.amount(totals.net, context),
          unit: currency,
          subtitle: percent('billing.kpi.net_margin', totals.netMargin),
          iconColor: totals.net < 0
              ? context.errorColor
              : context.clinicStatusCurrent,
          valueColor: totals.net < 0 ? context.errorColor : null,
          progress: totals.netMargin.abs(),
          animationDelay: const Duration(milliseconds: 240),
        ),
      ],
    );
  }
}
