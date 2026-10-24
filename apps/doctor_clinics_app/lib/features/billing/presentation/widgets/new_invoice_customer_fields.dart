import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/invoice_form_controller.dart';

/// Income-type selector and customer name for non-patient sales.
class NewInvoiceCustomerFields extends StatelessWidget {
  const NewInvoiceCustomerFields({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder<String>(
          valueListenable: controller.incomeType,
          builder: (context, value, _) => AppDropdownField<String>(
            label: 'billing.invoice_form.income_type'.tr(),
            prefixIcon: Icons.sell_outlined,
            value: value,
            items: [
              DropdownMenuItem(
                value: AppConstants.invoiceTypeSale,
                child: Text('billing.invoice_form.type_sale'.tr()),
              ),
              DropdownMenuItem(
                value: AppConstants.invoiceTypeOtherIncome,
                child: Text('billing.invoice_form.type_other_income'.tr()),
              ),
            ],
            onChanged: (next) {
              if (next != null) controller.incomeType.value = next;
            },
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: controller.customer,
          label: 'billing.invoice_form.customer'.tr(),
          hint: 'billing.invoice_form.customer_hint'.tr(),
          prefixIcon: Icons.person_outline_rounded,
        ),
      ],
    );
  }
}
