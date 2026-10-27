import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expense_columns.dart';

import 'expense_table_head.dart';
import 'expense_table_row.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_table_empty.dart';

/// Expense head plus scrollable rows.
class ExpenseTable extends StatelessWidget {
  const ExpenseTable({
    super.key,
    required this.expenses,
    required this.categoryName,
    this.onExpenseTap,
    this.emptyTitleKey = 'billing.expenses.empty',
    this.emptyHintKey = 'billing.expenses.empty_hint',
  });

  final List<Expense> expenses;
  final String Function(Expense expense) categoryName;
  final ValueChanged<Expense>? onExpenseTap;
  final String emptyTitleKey;
  final String emptyHintKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = math.max(
          constraints.maxWidth,
          ExpenseColumns.minWidth.w,
        );
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                const ExpenseTableHead(),
                Expanded(
                  child: expenses.isEmpty
                      ? FinanceTableEmpty(
                          icon: Icons.wallet_outlined,
                          titleKey: emptyTitleKey,
                          hintKey: emptyHintKey,
                        )
                      : _list(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _list(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: expenses.length,
      separatorBuilder: (_, _) =>
          Divider(height: 1, color: context.clinicBorder),
      itemBuilder: (context, index) => ExpenseTableRow(
        expense: expenses[index],
        categoryName: categoryName(expenses[index]),
        onTap: onExpenseTap == null
            ? null
            : () => onExpenseTap!(expenses[index]),
      ),
    );
  }
}
