import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_expense_columns.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

import 'billing_amount_cell.dart';
import 'billing_category_pill.dart';
import 'billing_table_cell.dart';
import 'billing_text_cell.dart';

/// One row in the expense log.
class BillingExpenseRowWidget extends StatelessWidget {
  const BillingExpenseRowWidget({
    super.key,
    required this.expense,
    required this.categoryName,
  });

  final Expense expense;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final notes = expense.notes?.trim() ?? '';
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          BillingTableCell(
            flex: BillingExpenseColumns.date,
            centered: true,
            child: ResponsiveText(
              BillingFormat.date(expense.expenseDate, context),
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
              color: context.clinicTextPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          BillingTableCell(
            flex: BillingExpenseColumns.category,
            child: BillingCategoryPill(label: categoryName),
          ),
          BillingTextCell(
            flex: BillingExpenseColumns.description,
            text: expense.description.isEmpty
                ? 'billing.value.none'.tr()
                : expense.description,
            color: context.clinicTextPrimary,
            fontWeight: FontWeight.w600,
          ),
          BillingTextCell(
            flex: BillingExpenseColumns.notes,
            text: notes.isEmpty ? 'billing.value.none'.tr() : notes,
            color: context.clinicTextSecondary,
          ),
          BillingAmountCell(
            flex: BillingExpenseColumns.amount,
            piasters: expense.amountPiasters,
            color: context.clinicStatusUrgent,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
