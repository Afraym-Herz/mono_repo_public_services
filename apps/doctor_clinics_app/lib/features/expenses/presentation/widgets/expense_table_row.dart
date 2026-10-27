import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expense_columns.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_amount_cell.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_category_pill.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_table_cell.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_text_cell.dart';

/// One row in the expense log.
class ExpenseTableRow extends StatelessWidget {
  const ExpenseTableRow({
    super.key,
    required this.expense,
    required this.categoryName,
    this.onTap,
  });

  final Expense expense;
  final String categoryName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final notes = expense.notes?.trim() ?? '';
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
              flex: ExpenseColumns.date,
              alignment: AlignmentDirectional.center,
              child: ResponsiveText(
                FinanceFormat.date(expense.expenseDate, context),
                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                color: context.clinicTextPrimary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            FinanceTableCell(
              flex: ExpenseColumns.category,
              child: FinanceCategoryPill(label: categoryName),
            ),
            FinanceTextCell(
              flex: ExpenseColumns.description,
              text: expense.description.isEmpty
                  ? 'billing.value.none'.tr()
                  : expense.description,
              color: context.clinicTextPrimary,
              fontWeight: FontWeight.w600,
            ),
            FinanceTextCell(
              flex: ExpenseColumns.notes,
              text: notes.isEmpty ? 'billing.value.none'.tr() : notes,
              color: context.clinicTextSecondary,
            ),
            FinanceAmountCell(
              flex: ExpenseColumns.amount,
              piasters: expense.amountPiasters,
              color: context.clinicStatusUrgent,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
