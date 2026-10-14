import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  const factory Invoice({
    required int id,
    required int patientId,
    required String invoiceNumber,
    required DateTime invoiceDate,
    required int totalPiasters,
    required int paidPiasters,
    required int duePiasters,
    required String status,
    String? notes,
    required int createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}