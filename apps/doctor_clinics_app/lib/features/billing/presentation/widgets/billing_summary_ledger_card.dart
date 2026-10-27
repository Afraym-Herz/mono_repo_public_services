import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/core/finance/helpers/ledger_filter.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/open_billing_modal.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_ledger_table_card.dart';

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
    final rows = LedgerFilter.rows(overview.ledgerRows, query);
    final searching = query.trim().isNotEmpty;
    return FinanceLedgerTableCard(
      rows: rows,
      title: 'billing.ledger.title'.tr(),
      icon: Icons.receipt_long_outlined,
      countLabel: 'billing.ledger.count'.tr(
        namedArgs: {'count': FinanceFormat.number(rows.length, context)},
      ),
      emptyTitleKey: searching
          ? 'billing.search.empty'
          : 'billing.ledger.empty',
      emptyHintKey: searching
          ? 'billing.search.empty_hint'
          : 'billing.ledger.empty_hint',
      onRowTap: (row) => openBillingInvoice(context, row.id),
    );
  }
}
