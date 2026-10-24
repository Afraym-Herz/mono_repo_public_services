import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_ledger_columns.dart';

import 'billing_amount_cell.dart';
import 'billing_ledger_invoice_cell.dart';
import 'billing_ledger_trailing_cells.dart';
import 'billing_table_cell.dart';
import 'billing_text_cell.dart';
import 'billing_type_pill.dart';

/// One invoice/purchase row in the accounts ledger.
class BillingLedgerRowWidget extends StatelessWidget {
  const BillingLedgerRowWidget({super.key, required this.row});

  final BillingLedgerRow row;

  @override
  Widget build(BuildContext context) {
    final muted = context.clinicTextSecondary;
    final party = row.counterparty.isEmpty ? _emptyParty() : row.counterparty;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          BillingTableCell(
            flex: BillingLedgerColumns.document,
            child: BillingLedgerInvoiceCell(row: row),
          ),
          BillingTableCell(
            flex: BillingLedgerColumns.type,
            child: BillingTypePill(type: row.type),
          ),
          BillingTextCell(
            flex: BillingLedgerColumns.party,
            text: party,
            color: context.clinicTextPrimary,
          ),
          BillingTextCell(
            flex: BillingLedgerColumns.statement,
            text: row.statement.isEmpty
                ? 'billing.ledger.no_statement'.tr()
                : row.statement,
            color: muted,
          ),
          BillingAmountCell(
            flex: BillingLedgerColumns.total,
            piasters: row.totalPiasters,
            color: context.clinicTextPrimary,
          ),
          BillingAmountCell(
            flex: BillingLedgerColumns.paid,
            piasters: row.paidPiasters,
            color: row.paidPiasters > 0 ? context.clinicStatusDone : muted,
          ),
          BillingAmountCell(
            flex: BillingLedgerColumns.due,
            piasters: row.duePiasters,
            color: row.duePiasters > 0 ? context.clinicStatusUrgent : muted,
          ),
          BillingLedgerTrailingCells(row: row),
        ],
      ),
    );
  }

  String _emptyParty() {
    if (row.isPurchase) return 'billing.value.no_supplier'.tr();
    if (row.type == AppConstants.invoiceTypePatient) {
      return 'billing.value.none'.tr();
    }
    return 'billing.ledger.walk_in'.tr();
  }
}
