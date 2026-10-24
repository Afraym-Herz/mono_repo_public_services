import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_item.freezed.dart';
part 'invoice_item.g.dart';

@freezed
class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required int id,
    required int invoiceId,
    required String description,
    required int quantity,
    required int unitPricePiasters,
    required int totalPiasters,
    String? notes,
  }) = _InvoiceItem;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);
}
