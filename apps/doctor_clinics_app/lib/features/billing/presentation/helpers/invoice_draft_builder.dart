import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_form_controller.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/new_invoice_draft.dart';

/// Turns the form controller into the entities the cubit persists.
class InvoiceDraftBuilder {
  InvoiceDraftBuilder._();

  static NewInvoiceDraft? build(InvoiceFormController controller) {
    final isPatient = controller.mode == InvoiceFormMode.patient;
    final selected = controller.patient.value;
    final amounts = controller.totals;
    if (isPatient && selected == null) return null;
    if (amounts.total <= 0) return null;
    if (!controller.lines.every((line) => line.isValid)) return null;
    if (amounts.discount > amounts.subtotal || amounts.paid > amounts.total) {
      return null;
    }

    final type = isPatient
        ? AppConstants.invoiceTypePatient
        : controller.incomeType.value;
    final prefix = switch (type) {
      AppConstants.invoiceTypeSale => 'SALE',
      AppConstants.invoiceTypeOtherIncome => 'INC',
      _ => 'INV',
    };
    final now = DateTime.now();
    final invoiceDate = controller.date.value;
    return NewInvoiceDraft(
      invoice: Invoice(
        id: 0,
        patientId: isPatient ? selected!.id : null,
        type: type,
        customerName: isPatient ? null : _optional(controller.customer.text),
        invoiceNumber: '$prefix-${now.millisecondsSinceEpoch}',
        invoiceDate: invoiceDate,
        totalPiasters: amounts.total,
        discountPiasters: amounts.discount,
        paidPiasters: amounts.paid,
        duePiasters: amounts.due,
        status: amounts.status,
        notes: _optional(controller.notes.text),
        createdBy: 0,
        createdAt: invoiceDate,
        updatedAt: now,
      ),
      items: [
        for (final line in controller.lines)
          InvoiceItem(
            id: 0,
            invoiceId: 0,
            description: line.description.text.trim(),
            quantity: line.quantityValue!,
            unitPricePiasters: line.unitPricePiasters!,
            totalPiasters: line.totalPiasters,
          ),
      ],
      paidPiasters: amounts.paid,
      paymentMethod: controller.paymentMethod.value,
    );
  }

  static String? _optional(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
