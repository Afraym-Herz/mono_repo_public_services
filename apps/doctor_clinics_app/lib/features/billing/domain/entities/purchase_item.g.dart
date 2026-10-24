// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseItemImpl _$$PurchaseItemImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseItemImpl(
      id: (json['id'] as num).toInt(),
      purchaseId: (json['purchaseId'] as num).toInt(),
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitCostPiasters: (json['unitCostPiasters'] as num).toInt(),
      totalPiasters: (json['totalPiasters'] as num).toInt(),
    );

Map<String, dynamic> _$$PurchaseItemImplToJson(_$PurchaseItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchaseId': instance.purchaseId,
      'description': instance.description,
      'quantity': instance.quantity,
      'unitCostPiasters': instance.unitCostPiasters,
      'totalPiasters': instance.totalPiasters,
    };
