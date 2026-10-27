import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/core/finance/helpers/ledger_filter.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/open_billing_modal.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_ledger_table_card.dart';

/// Full-height payment log built from the invoice ledger rows.
class BillingPaymentsTab extends StatelessWidget {
  const BillingPaymentsTab({
    super.key,
    required this.overview,
    required this.query,
  });

  final BillingOverview overview;
  final String query;

  @override
  Widget build(BuildContext context) {
    final paidRows = overview.ledgerRows
        .where((row) => row.paidPiasters > 0)
        .toList();
    final rows = LedgerFilter.rows(paidRows, query);
    final searching = query.trim().isNotEmpty;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        0,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: FinanceLedgerTableCard(
        rows: rows,
        title: 'billing.payments.title'.tr(),
        icon: Icons.payments_outlined,
        countLabel: 'billing.payments.count'.tr(
          namedArgs: {'count': FinanceFormat.number(rows.length, context)},
        ),
        emptyTitleKey: searching
            ? 'billing.search.empty'
            : 'billing.payments.empty',
        emptyHintKey: searching
            ? 'billing.search.empty_hint'
            : 'billing.payments.empty_hint',
        onRowTap: (row) => openBillingInvoice(context, row.id),
      ),
    );
  }
}
