import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  const factory Payment({
    required int id,
    required int invoiceId,
    required String receiptNumber,
    required int amountPiasters,
    required String paymentMethod,
    required DateTime paymentDate,
    String? notes,
    required int createdBy,
    required DateTime createdAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}