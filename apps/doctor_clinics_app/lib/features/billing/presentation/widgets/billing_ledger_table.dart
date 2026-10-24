import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';

import 'billing_ledger_head.dart';
import 'billing_ledger_row.dart';
import 'billing_table_empty.dart';

/// Ledger head plus scrollable invoice/payment rows.
class BillingLedgerTable extends StatelessWidget {
  const BillingLedgerTable({
    super.key,
    required this.rows,
    this.emptyTitleKey = 'billing.ledger.empty',
    this.emptyHintKey = 'billing.ledger.empty_hint',
  });

  final List<BillingLedgerRow> rows;
  final String emptyTitleKey;
  final String emptyHintKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BillingLedgerHead(),
        Expanded(
          child: rows.isEmpty
              ? BillingTableEmpty(
                  icon: Icons.receipt_long_outlined,
                  titleKey: emptyTitleKey,
                  hintKey: emptyHintKey,
                )
              : _list(context),
        ),
      ],
    );
  }

  Widget _list(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: rows.length,
      separatorBuilder: (_, _) =>
          Divider(height: 1, color: context.clinicBorder),
      itemBuilder: (context, index) => BillingLedgerRowWidget(row: rows[index]),
    );
  }
}
