import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/new_purchase_draft.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/purchase_form_controller.dart';

/// Turns the supplier-bill controller into the entities the cubit persists.
class PurchaseDraftBuilder {
  PurchaseDraftBuilder._();

  static NewPurchaseDraft? build(PurchaseFormController controller) {
    final amounts = controller.totals;
    if (amounts.total <= 0) return null;
    if (!controller.lines.every((line) => line.isValid)) return null;
    if (amounts.paid > amounts.total) return null;

    final now = DateTime.now();
    final purchaseDate = controller.date.value;
    return NewPurchaseDraft(
      purchase: Purchase(
        id: 0,
        vendorId: controller.vendor.value?.id,
        purchaseNumber: 'PUR-${now.millisecondsSinceEpoch}',
        purchaseDate: purchaseDate,
        totalPiasters: amounts.total,
        paidPiasters: amounts.paid,
        duePiasters: amounts.due,
        status: amounts.status,
        notes: _optional(controller.notes.text),
        createdBy: 0,
        createdAt: purchaseDate,
        updatedAt: now,
      ),
      items: [
        for (final line in controller.lines)
          PurchaseItem(
            id: 0,
            purchaseId: 0,
            description: line.description.text.trim(),
            quantity: line.quantityValue!,
            unitCostPiasters: line.unitPricePiasters!,
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
