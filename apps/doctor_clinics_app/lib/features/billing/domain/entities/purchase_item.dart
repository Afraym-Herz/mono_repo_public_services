import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_item.freezed.dart';
part 'purchase_item.g.dart';

@freezed
class PurchaseItem with _$PurchaseItem {
  const factory PurchaseItem({
    required int id,
    required int purchaseId,
    required String description,
    required int quantity,
    required int unitCostPiasters,
    required int totalPiasters,
  }) = _PurchaseItem;

  factory PurchaseItem.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemFromJson(json);
}
