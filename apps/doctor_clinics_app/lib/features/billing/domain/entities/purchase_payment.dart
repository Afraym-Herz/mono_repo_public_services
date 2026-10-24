import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_payment.freezed.dart';
part 'purchase_payment.g.dart';

/// Money paid to a supplier against a purchase bill.
@freezed
class PurchasePayment with _$PurchasePayment {
  const factory PurchasePayment({
    required int id,
    required int purchaseId,
    int? vendorId,
    required String receiptNumber,
    required int amountPiasters,
    required String paymentMethod,
    required DateTime paymentDate,
    String? notes,
    required int createdBy,
    required DateTime createdAt,
  }) = _PurchasePayment;

  factory PurchasePayment.fromJson(Map<String, dynamic> json) =>
      _$PurchasePaymentFromJson(json);
}
