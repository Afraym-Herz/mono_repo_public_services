import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';

import 'expense_table.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_table_title.dart';

/// Bordered surface holding the expense log title and its table.
class ExpenseTableCard extends StatelessWidget {
  const ExpenseTableCard({
    super.key,
    required this.expenses,
    required this.categoryName,
    required this.countLabel,
    required this.emptyTitleKey,
    required this.emptyHintKey,
    this.onExpenseTap,
  });

  final List<Expense> expenses;
  final String Function(Expense expense) categoryName;
  final ValueChanged<Expense>? onExpenseTap;
  final String countLabel;
  final String emptyTitleKey;
  final String emptyHintKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        border: Border.all(color: context.clinicBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FinanceTableTitle(
            title: 'billing.expenses.title'.tr(),
            icon: Icons.wallet_outlined,
            countLabel: countLabel,
          ),
          Expanded(
            child: ExpenseTable(
              expenses: expenses,
              categoryName: categoryName,
              onExpenseTap: onExpenseTap,
              emptyTitleKey: emptyTitleKey,
              emptyHintKey: emptyHintKey,
            ),
          ),
        ],
      ),
    );
  }
}
