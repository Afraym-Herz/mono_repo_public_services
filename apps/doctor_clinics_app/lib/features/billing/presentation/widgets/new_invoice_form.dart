import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/invoice_form_controller.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_date_field.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_line_items.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_totals_card.dart';
import 'new_invoice_amount_fields.dart';
import 'new_invoice_customer_fields.dart';
import 'new_invoice_patient_picker.dart';

/// Scrollable body of the new-invoice / sale modal.
class NewInvoiceForm extends StatelessWidget {
  const NewInvoiceForm({
    super.key,
    required this.controller,
    required this.mode,
  });

  final InvoiceFormController controller;
  final InvoiceFormMode mode;

  @override
  Widget build(BuildContext context) {
    final isPatient = mode == InvoiceFormMode.patient;
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isPatient)
          NewInvoicePatientPicker(controller: controller)
        else
          NewInvoiceCustomerFields(controller: controller),
        gap,
        FinanceDateField(
          date: controller.date,
          labelKey: 'billing.invoice_form.date',
        ),
        gap,
        FinanceLineItems(
          lines: controller.lines,
          revision: controller.linesRevision,
          onAdd: controller.addLine,
          onRemove: controller.removeLine,
          titleKey: isPatient
              ? 'billing.invoice_form.services'
              : 'billing.invoice_form.items',
          addLabelKey: isPatient
              ? 'billing.invoice_form.add_service'
              : 'billing.invoice_form.add_item',
          descriptionLabelKey: isPatient
              ? 'billing.invoice_form.service_description'
              : 'billing.invoice_form.item_description',
          descriptionHintKey: isPatient
              ? 'billing.invoice_form.service_hint'
              : 'billing.invoice_form.item_hint',
          priceLabelKey: 'billing.invoice_form.unit_price',
        ),
        gap,
        NewInvoiceAmountFields(controller: controller),
        gap,
        AppTextField(
          controller: controller.notes,
          label: 'billing.invoice_form.notes'.tr(),
          hint: 'billing.invoice_form.notes_hint'.tr(),
          prefixIcon: Icons.notes_outlined,
          maxLines: 3,
        ),
        gap,
        ValueListenableBuilder<int>(
          valueListenable: controller.revision,
          builder: (context, _, _) =>
              FinanceTotalsCard(totals: controller.totals),
        ),
      ],
    );
  }
}
