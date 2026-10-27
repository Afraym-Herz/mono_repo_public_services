import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expenses_overview.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expense_filter.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/open_expenses_modal.dart';

import 'expense_table_card.dart';

/// Full-height expense log with category lookup and search filtering.
class ExpensesTab extends StatelessWidget {
  const ExpensesTab({
    super.key,
    required this.overview,
    required this.query,
  });

  final ExpensesOverview overview;
  final String query;

  @override
  Widget build(BuildContext context) {
    String categoryName(Expense expense) => _categoryName(overview, expense);

    final expenses = ExpenseFilter.expenses(
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
      child: ExpenseTableCard(
        expenses: expenses,
        categoryName: categoryName,
        countLabel: 'billing.expenses.count'.tr(
          namedArgs: {'count': FinanceFormat.number(expenses.length, context)},
        ),
        emptyTitleKey: searching
            ? 'billing.search.empty'
            : 'billing.expenses.empty',
        emptyHintKey: searching
            ? 'billing.search.empty_hint'
            : 'billing.expenses.empty_hint',
        onExpenseTap: (expense) => openExpensesExpense(context, expense.id),
      ),
    );
  }

  String _categoryName(ExpensesOverview overview, Expense expense) {
    final id = int.tryParse(expense.category);
    final name = id == null ? null : overview.expenseCategories[id];
    return name == null || name.isEmpty
        ? 'billing.expense.uncategorized'.tr()
        : name;
  }
}
