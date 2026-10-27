import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_date_field.dart';

/// Amount, method, date and notes inputs of the record-payment form.
class BillingPaymentFields extends StatelessWidget {
  const BillingPaymentFields({
    super.key,
    required this.amount,
    required this.notes,
    required this.method,
    required this.date,
    required this.duePiasters,
  });

  final TextEditingController amount;
  final TextEditingController notes;
  final ValueNotifier<String> method;
  final ValueNotifier<DateTime> date;
  final int duePiasters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          controller: amount,
          label: 'billing.payment.amount'.tr(),
          hint: 'billing.payment.amount_hint'.tr(),
          prefixIcon: Icons.payments_outlined,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: _validateAmount,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        ValueListenableBuilder<String>(
          valueListenable: method,
          builder: (context, value, _) => AppDropdownField<String>(
            label: 'billing.payment.method'.tr(),
            prefixIcon: Icons.credit_card_outlined,
            value: value,
            items: [
              _item(AppConstants.paymentMethodCash, 'method_cash'),
              _item(AppConstants.paymentMethodCard, 'method_card'),
              _item(AppConstants.paymentMethodTransfer, 'method_transfer'),
            ],
            onChanged: (next) => method.value = next ?? value,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        FinanceDateField(date: date, labelKey: 'billing.payment.date'),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: notes,
          label: 'billing.payment.notes'.tr(),
          hint: 'billing.payment.notes_hint'.tr(),
          prefixIcon: Icons.notes_outlined,
          maxLines: 2,
        ),
      ],
    );
  }

  DropdownMenuItem<String> _item(String value, String label) {
    return DropdownMenuItem(
      value: value,
      child: Text('billing.invoice_form.$label'.tr()),
    );
  }

  String? _validateAmount(String? value) {
    final piasters = MoneyInput.tryParsePiasters(value ?? '');
    if (piasters == null || piasters <= 0) {
      return 'billing.payment.invalid_amount'.tr();
    }
    if (piasters > duePiasters) return 'billing.payment.exceeds_due'.tr();
    return null;
  }
}
