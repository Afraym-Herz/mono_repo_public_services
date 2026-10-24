import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';

import 'billing_expense_table.dart';
import 'billing_table_title.dart';

/// Bordered surface holding the expense log title and its table.
class BillingExpenseTableCard extends StatelessWidget {
  const BillingExpenseTableCard({
    super.key,
    required this.expenses,
    required this.categoryName,
    required this.countLabel,
    required this.emptyTitleKey,
    required this.emptyHintKey,
  });

  final List<Expense> expenses;
  final String Function(Expense expense) categoryName;
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
          BillingTableTitle(
            title: 'billing.expenses.title'.tr(),
            icon: Icons.wallet_outlined,
            countLabel: countLabel,
          ),
          Expanded(
            child: BillingExpenseTable(
              expenses: expenses,
              categoryName: categoryName,
              emptyTitleKey: emptyTitleKey,
              emptyHintKey: emptyHintKey,
            ),
          ),
        ],
      ),
    );
  }
}
