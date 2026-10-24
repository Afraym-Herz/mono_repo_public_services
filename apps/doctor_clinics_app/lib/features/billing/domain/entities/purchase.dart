import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

/// Supplier bill (money out) for tools, equipment or supplies.
@freezed
class Purchase with _$Purchase {
  const factory Purchase({
    required int id,
    int? vendorId,
    required String purchaseNumber,
    required DateTime purchaseDate,
    required int totalPiasters,
    required int paidPiasters,
    required int duePiasters,
    required String status,
    String? notes,
    required int createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
}
