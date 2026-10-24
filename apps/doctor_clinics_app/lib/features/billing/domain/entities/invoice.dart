import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  const factory Invoice({
    required int id,
    int? patientId,
    @Default(AppConstants.invoiceTypePatient) String type,
    String? customerName,
    required String invoiceNumber,
    required DateTime invoiceDate,
    required int totalPiasters,
    @Default(0) int discountPiasters,
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
