import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/purchase_form_controller.dart';

/// Down-payment and payment-method fields of the supplier bill.
class NewPurchaseAmountFields extends StatelessWidget {
  const NewPurchaseAmountFields({super.key, required this.controller});

  final PurchaseFormController controller;

  @override
  Widget build(BuildContext context) {
    final paidNow = AppTextField(
      controller: controller.paidNow,
      label: 'billing.purchase_form.paid_now'.tr(),
      hint: '0',
      prefixIcon: Icons.account_balance_wallet_outlined,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        final piasters = MoneyInput.tryParsePiasters(value ?? '');
        if (piasters == null) {
          return 'billing.invoice_form.invalid_amount'.tr();
        }
        return piasters > controller.totals.total
            ? 'billing.invoice_form.paid_exceeds'.tr()
            : null;
      },
    );
    final method = ValueListenableBuilder<int>(
      valueListenable: controller.revision,
      builder: (context, _, _) => AppDropdownField<String>(
        label: 'billing.invoice_form.payment_method'.tr(),
        value: controller.paymentMethod.value,
        prefixIcon: Icons.credit_card_outlined,
        enabled: (MoneyInput.tryParsePiasters(controller.paidNow.text) ?? 0) > 0,
        items: [
          DropdownMenuItem(
            value: AppConstants.paymentMethodCash,
            child: Text('billing.invoice_form.method_cash'.tr()),
          ),
          DropdownMenuItem(
            value: AppConstants.paymentMethodCard,
            child: Text('billing.invoice_form.method_card'.tr()),
          ),
          DropdownMenuItem(
            value: AppConstants.paymentMethodTransfer,
            child: Text('billing.invoice_form.method_transfer'.tr()),
          ),
        ],
        onChanged: (value) {
          if (value != null) controller.paymentMethod.value = value;
        },
      ),
    );

    if (context.isMobileOrSmallTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          paidNow,
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          method,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: paidNow),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(child: method),
      ],
    );
  }
}
