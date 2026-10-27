// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseImpl _$$PurchaseImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseImpl(
      id: (json['id'] as num).toInt(),
      vendorId: (json['vendorId'] as num?)?.toInt(),
      purchaseNumber: json['purchaseNumber'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      totalPiasters: (json['totalPiasters'] as num).toInt(),
      paidPiasters: (json['paidPiasters'] as num).toInt(),
      duePiasters: (json['duePiasters'] as num).toInt(),
      status: json['status'] as String,
      notes: json['notes'] as String?,
      createdBy: (json['createdBy'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PurchaseImplToJson(_$PurchaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendorId': instance.vendorId,
      'purchaseNumber': instance.purchaseNumber,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'totalPiasters': instance.totalPiasters,
      'paidPiasters': instance.paidPiasters,
      'duePiasters': instance.duePiasters,
      'status': instance.status,
      'notes': instance.notes,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
