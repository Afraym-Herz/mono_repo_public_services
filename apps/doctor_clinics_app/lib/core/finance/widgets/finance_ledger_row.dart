import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';
import 'package:doctor_clinics_app/core/finance/helpers/ledger_columns.dart';

import 'finance_amount_cell.dart';
import 'finance_ledger_document_cell.dart';
import 'finance_ledger_trailing_cells.dart';
import 'finance_table_cell.dart';
import 'finance_text_cell.dart';

/// One invoice/purchase row in the accounts ledger.
class FinanceLedgerRow extends StatelessWidget {
  const FinanceLedgerRow({super.key, required this.row, this.onTap});

  final LedgerRow row;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final muted = context.clinicTextSecondary;
    final party = row.counterparty.isEmpty ? _emptyParty() : row.counterparty;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        child: Row(
          children: [
            FinanceTableCell(
              flex: LedgerColumns.document,
              child: FinanceLedgerDocumentCell(row: row),
            ),
            FinanceTextCell(
              flex: LedgerColumns.party,
              text: party,
              color: context.clinicTextPrimary,
            ),
            FinanceTextCell(
              flex: LedgerColumns.statement,
              text: row.statement.isEmpty
                  ? 'billing.ledger.no_statement'.tr()
                  : row.statement,
              color: muted,
            ),
            FinanceAmountCell(
              flex: LedgerColumns.total,
              piasters: row.totalPiasters,
              color: context.clinicTextPrimary,
            ),
            FinanceAmountCell(
              flex: LedgerColumns.paid,
              piasters: row.paidPiasters,
              color: row.paidPiasters > 0 ? context.clinicStatusDone : muted,
            ),
            FinanceAmountCell(
              flex: LedgerColumns.due,
              piasters: row.duePiasters,
              color: row.duePiasters > 0 ? context.clinicStatusUrgent : muted,
            ),
            FinanceLedgerTrailingCells(row: row),
          ],
        ),
      ),
    );
  }

  String _emptyParty() {
    if (row.isPurchase) return 'billing.value.no_supplier'.tr();
    return 'billing.ledger.walk_in'.tr();
  }
}
