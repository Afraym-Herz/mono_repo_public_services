import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';
import 'package:doctor_clinics_app/core/finance/helpers/ledger_filter.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_ledger_table_card.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expenses_overview.dart';

/// Full-height supplier purchase log (tools, equipment, supplies).
class PurchasesTab extends StatelessWidget {
  const PurchasesTab({
    super.key,
    required this.overview,
    required this.query,
  });

  final ExpensesOverview overview;
  final String query;

  @override
  Widget build(BuildContext context) {
    final rows = LedgerFilter.rows(overview.purchaseRows, query);
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
        title: 'billing.purchases.title'.tr(),
        icon: Icons.shopping_bag_outlined,
        countLabel: 'billing.purchases.count'.tr(
          namedArgs: {'count': FinanceFormat.number(rows.length, context)},
        ),
        emptyTitleKey: searching
            ? 'billing.search.empty'
            : 'billing.purchases.empty',
        emptyHintKey: searching
            ? 'billing.search.empty_hint'
            : 'billing.purchases.empty_hint',
      ),
    );
  }
}
