import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';
import 'package:doctor_clinics_app/core/finance/helpers/ledger_columns.dart';

import 'finance_ledger_date_cell.dart';
import 'finance_status_pill.dart';
import 'finance_table_cell.dart';

/// Date and status columns at the end of a ledger row.
class FinanceLedgerTrailingCells extends StatelessWidget {
  const FinanceLedgerTrailingCells({super.key, required this.row});

  final LedgerRow row;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: LedgerColumns.date + LedgerColumns.status,
      child: Row(
        children: [
          FinanceTableCell(
            flex: LedgerColumns.date,
            alignment: AlignmentDirectional.center,
            child: FinanceLedgerDateCell(row: row),
          ),
          FinanceTableCell(
            flex: LedgerColumns.status,
            alignment: AlignmentDirectional.center,
            child: FinanceStatusPill(status: row.status),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              // Handle action
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text('Edit')),
              const PopupMenuItem(value: 'delete', child: Text('Delete')),
            ],
          ),
        ],
      ),
    );
  }
}
