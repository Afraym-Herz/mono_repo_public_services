import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_form_controller.dart';

/// Discount, down-payment and payment-method fields of the invoice form.
class NewInvoiceAmountFields extends StatelessWidget {
  const NewInvoiceAmountFields({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    final discount = _discountField(context);
    final paidNow = _paidNowField(context);
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (context.isMobileOrSmallTablet) ...[
          discount,
          gap,
          paidNow,
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: discount),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(child: paidNow),
            ],
          ),
        gap,
        ValueListenableBuilder<int>(
          valueListenable: controller.revision,
          builder: (context, _, _) => AppDropdownField<String>(
            label: 'billing.invoice_form.payment_method'.tr(),
            value: controller.paymentMethod.value,
            prefixIcon: Icons.credit_card_outlined,
            enabled:
                (MoneyInput.tryParsePiasters(controller.paidNow.text) ?? 0) > 0,
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
        ),
      ],
    );
  }

  Widget _discountField(BuildContext context) {
    return AppTextField(
      controller: controller.discount,
      label: 'billing.invoice_form.discount'.tr(),
      hint: '0',
      prefixIcon: Icons.percent_rounded,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        final piasters = MoneyInput.tryParsePiasters(value ?? '');
        if (piasters == null) {
          return 'billing.invoice_form.invalid_amount'.tr();
        }
        return piasters > controller.totals.subtotal
            ? 'billing.invoice_form.discount_exceeds'.tr()
            : null;
      },
    );
  }

  Widget _paidNowField(BuildContext context) {
    return AppTextField(
      controller: controller.paidNow,
      label: 'billing.invoice_form.paid_now'.tr(),
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
  }
}
