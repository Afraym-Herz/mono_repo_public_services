import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_expense_columns.dart';

import 'billing_expense_head.dart';
import 'billing_expense_row.dart';
import 'billing_table_empty.dart';

/// Expense head plus scrollable rows.
class BillingExpenseTable extends StatelessWidget {
  const BillingExpenseTable({
    super.key,
    required this.expenses,
    required this.categoryName,
    this.emptyTitleKey = 'billing.expenses.empty',
    this.emptyHintKey = 'billing.expenses.empty_hint',
  });

  final List<Expense> expenses;
  final String Function(Expense expense) categoryName;
  final String emptyTitleKey;
  final String emptyHintKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = math.max(
          constraints.maxWidth,
          BillingExpenseColumns.minWidth.w,
        );
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                const BillingExpenseHead(),
                Expanded(
                  child: expenses.isEmpty
                      ? BillingTableEmpty(
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
      itemBuilder: (context, index) => BillingExpenseRowWidget(
        expense: expenses[index],
        categoryName: categoryName(expenses[index]),
      ),
    );
  }
}
