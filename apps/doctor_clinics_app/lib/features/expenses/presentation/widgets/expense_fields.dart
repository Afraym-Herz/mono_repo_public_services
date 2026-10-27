import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_date_field.dart';

/// Amount, date, description and notes inputs of the expense editor.
class ExpenseFields extends StatelessWidget {
  const ExpenseFields({
    super.key,
    required this.amount,
    required this.description,
    required this.notes,
    required this.date,
  });

  final TextEditingController amount;
  final TextEditingController description;
  final TextEditingController notes;
  final ValueNotifier<DateTime> date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          controller: amount,
          label: 'billing.expense_form.amount'.tr(),
          hint: '0',
          prefixIcon: Icons.payments_outlined,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: _validateAmount,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        FinanceDateField(date: date, labelKey: 'billing.expense_form.date'),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: description,
          label: 'billing.expense_form.description'.tr(),
          hint: 'billing.expense_form.description_hint'.tr(),
          prefixIcon: Icons.description_outlined,
          validator: AppValidators.required,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: notes,
          label: 'billing.expense_form.notes'.tr(),
          hint: 'billing.expense_form.notes_hint'.tr(),
          prefixIcon: Icons.notes_outlined,
          maxLines: 2,
        ),
      ],
    );
  }

  String? _validateAmount(String? value) {
    final piasters = MoneyInput.tryParsePiasters(value ?? '');
    return piasters == null || piasters <= 0
        ? 'billing.expense_form.invalid_amount'.tr()
        : null;
  }
}
