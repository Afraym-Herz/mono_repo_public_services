import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';

import 'finance_ledger_head.dart';
import 'finance_ledger_row.dart';
import 'finance_table_empty.dart';

/// Ledger head plus scrollable invoice/payment rows.
class FinanceLedgerTable extends StatelessWidget {
  const FinanceLedgerTable({
    super.key,
    required this.rows,
    this.onRowTap,
    this.emptyTitleKey = 'billing.ledger.empty',
    this.emptyHintKey = 'billing.ledger.empty_hint',
  });

  final List<LedgerRow> rows;
  final ValueChanged<LedgerRow>? onRowTap;
  final String emptyTitleKey;
  final String emptyHintKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FinanceLedgerHead(),
        Expanded(
          child: rows.isEmpty
              ? FinanceTableEmpty(
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
      itemBuilder: (context, index) => FinanceLedgerRow(
        row: rows[index],
        onTap: onRowTap == null ? null : () => onRowTap!(rows[index]),
      ),
    );
  }
}
