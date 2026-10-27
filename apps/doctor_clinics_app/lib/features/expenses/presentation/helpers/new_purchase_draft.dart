import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';

/// Purchase header plus its line items and optional down-payment.
class NewPurchaseDraft {
  const NewPurchaseDraft({
    required this.purchase,
    required this.items,
    required this.paidPiasters,
    required this.paymentMethod,
  });

  final Purchase purchase;
  final List<PurchaseItem> items;
  final int paidPiasters;
  final String paymentMethod;
}
