import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/purchase_form_controller.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_date_field.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_line_items.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_totals_card.dart';
import 'new_purchase_amount_fields.dart';
import 'new_purchase_vendor_field.dart';

/// Scrollable body of the supplier-bill modal.
class NewPurchaseForm extends StatelessWidget {
  const NewPurchaseForm({super.key, required this.controller});

  final PurchaseFormController controller;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NewPurchaseVendorField(controller: controller),
        gap,
        FinanceDateField(
          date: controller.date,
          labelKey: 'billing.purchase_form.date',
        ),
        gap,
        FinanceLineItems(
          lines: controller.lines,
          revision: controller.linesRevision,
          onAdd: controller.addLine,
          onRemove: controller.removeLine,
          titleKey: 'billing.purchase_form.items',
          addLabelKey: 'billing.purchase_form.add_item',
          descriptionLabelKey: 'billing.purchase_form.item_description',
          descriptionHintKey: 'billing.purchase_form.item_hint',
          priceLabelKey: 'billing.purchase_form.unit_cost',
        ),
        gap,
        NewPurchaseAmountFields(controller: controller),
        gap,
        AppTextField(
          controller: controller.notes,
          label: 'billing.purchase_form.notes'.tr(),
          hint: 'billing.purchase_form.notes_hint'.tr(),
          prefixIcon: Icons.notes_outlined,
          maxLines: 3,
        ),
        gap,
        ValueListenableBuilder<int>(
          valueListenable: controller.revision,
          builder: (context, _, _) => FinanceTotalsCard(
            totals: controller.totals,
            showDiscount: false,
          ),
        ),
      ],
    );
  }
}
