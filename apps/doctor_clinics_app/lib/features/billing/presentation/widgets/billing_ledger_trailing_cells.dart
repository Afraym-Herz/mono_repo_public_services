import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_ledger_columns.dart';

import 'billing_ledger_date_cell.dart';
import 'billing_status_pill.dart';
import 'billing_table_cell.dart';

/// Date and status columns at the end of a ledger row.
class BillingLedgerTrailingCells extends StatelessWidget {
  const BillingLedgerTrailingCells({super.key, required this.row});

  final BillingLedgerRow row;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: BillingLedgerColumns.date + BillingLedgerColumns.status,
      child: Row(
        children: [
          BillingTableCell(
            flex: BillingLedgerColumns.date,
            centered: true,
            child: BillingLedgerDateCell(row: row),
          ),
          BillingTableCell(
            flex: BillingLedgerColumns.status,
            centered: true,
            child: BillingStatusPill(status: row.status),
          ),
        ],
      ),
    );
  }
}
