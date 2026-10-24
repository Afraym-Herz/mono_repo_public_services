import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_filter.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

import 'billing_ledger_table_card.dart';

/// Ledger preview shown inside the summary tab.
class BillingSummaryLedgerCard extends StatelessWidget {
  const BillingSummaryLedgerCard({
    super.key,
    required this.overview,
    required this.query,
  });

  final BillingOverview overview;
  final String query;

  @override
  Widget build(BuildContext context) {
    final rows = BillingFilter.rows(overview.ledgerRows, query);
    final searching = query.trim().isNotEmpty;
    return BillingLedgerTableCard(
      rows: rows,
      title: 'billing.ledger.title'.tr(),
      icon: Icons.receipt_long_outlined,
      countLabel: 'billing.ledger.count'.tr(
        namedArgs: {'count': BillingFormat.number(rows.length, context)},
      ),
      emptyTitleKey: searching
          ? 'billing.search.empty'
          : 'billing.ledger.empty',
      emptyHintKey: searching
          ? 'billing.search.empty_hint'
          : 'billing.ledger.empty_hint',
    );
  }
}
