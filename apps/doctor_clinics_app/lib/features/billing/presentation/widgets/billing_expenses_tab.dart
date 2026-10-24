import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_filter.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

import 'billing_expense_table_card.dart';

/// Full-height expense log with category lookup and search filtering.
class BillingExpensesTab extends StatelessWidget {
  const BillingExpensesTab({
    super.key,
    required this.overview,
    required this.query,
  });

  final BillingOverview overview;
  final String query;

  @override
  Widget build(BuildContext context) {
    String categoryName(Expense expense) => _categoryName(overview, expense);

    final expenses = BillingFilter.expenses(
      overview.expenses,
      query,
      categoryName,
    )..sort((a, b) => b.expenseDate.compareTo(a.expenseDate));
    final searching = query.trim().isNotEmpty;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        0,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: BillingExpenseTableCard(
        expenses: expenses,
        categoryName: categoryName,
        countLabel: 'billing.expenses.count'.tr(
          namedArgs: {'count': BillingFormat.number(expenses.length, context)},
        ),
        emptyTitleKey: searching
            ? 'billing.search.empty'
            : 'billing.expenses.empty',
        emptyHintKey: searching
            ? 'billing.search.empty_hint'
            : 'billing.expenses.empty_hint',
      ),
    );
  }

  String _categoryName(BillingOverview overview, Expense expense) {
    final id = int.tryParse(expense.category);
    final name = id == null ? null : overview.expenseCategories[id];
    return name == null || name.isEmpty
        ? 'billing.expense.uncategorized'.tr()
        : name;
  }
}
