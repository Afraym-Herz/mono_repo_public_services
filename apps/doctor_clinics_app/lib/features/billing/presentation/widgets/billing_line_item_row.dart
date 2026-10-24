import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_line_draft.dart';

/// One editable service/item line shared by invoices and purchase bills.
class BillingLineItemRow extends StatelessWidget {
  const BillingLineItemRow({
    super.key,
    required this.line,
    required this.canRemove,
    required this.onRemove,
    required this.descriptionLabelKey,
    required this.descriptionHintKey,
    required this.priceLabelKey,
  });

  final InvoiceLineDraft line;
  final bool canRemove;
  final VoidCallback onRemove;
  final String descriptionLabelKey;
  final String descriptionHintKey;
  final String priceLabelKey;

  @override
  Widget build(BuildContext context) {
    final description = _descriptionField(context);
    final quantity = _quantityField(context);
    final price = _priceField(context);
    final remove = IconButton(
      onPressed: canRemove ? onRemove : null,
      tooltip: 'billing.invoice_form.remove_service'.tr(),
      icon: const Icon(Icons.remove_circle_outline_rounded),
    );
    final gap = SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w);

    if (context.isMobileOrSmallTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          description,
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Row(
            children: [
              Expanded(child: quantity),
              gap,
              Expanded(flex: 2, child: price),
              remove,
            ],
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: description),
        gap,
        Expanded(child: quantity),
        gap,
        Expanded(flex: 2, child: price),
        remove,
      ],
    );
  }

  Widget _descriptionField(BuildContext context) {
    return AppTextField(
      controller: line.description,
      label: descriptionLabelKey.tr(),
      hint: descriptionHintKey.tr(),
      prefixIcon: Icons.medical_services_outlined,
      validator: AppValidators.required,
    );
  }

  Widget _quantityField(BuildContext context) {
    return AppTextField(
      controller: line.quantity,
      label: 'billing.invoice_form.quantity'.tr(),
      prefixIcon: Icons.numbers_rounded,
      keyboardType: TextInputType.number,
      validator: (value) {
        final count = int.tryParse(value?.trim() ?? '');
        return count == null || count <= 0
            ? 'billing.invoice_form.invalid_quantity'.tr()
            : null;
      },
    );
  }

  Widget _priceField(BuildContext context) {
    return AppTextField(
      controller: line.unitPrice,
      label: priceLabelKey.tr(),
      prefixIcon: Icons.payments_outlined,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        final piasters = MoneyInput.tryParsePiasters(value ?? '');
        return piasters == null || piasters <= 0
            ? 'billing.invoice_form.invalid_amount'.tr()
            : null;
      },
    );
  }
}
