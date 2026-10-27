// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchasePaymentImpl _$$PurchasePaymentImplFromJson(
  Map<String, dynamic> json,
) => _$PurchasePaymentImpl(
  id: (json['id'] as num).toInt(),
  purchaseId: (json['purchaseId'] as num).toInt(),
  vendorId: (json['vendorId'] as num?)?.toInt(),
  receiptNumber: json['receiptNumber'] as String,
  amountPiasters: (json['amountPiasters'] as num).toInt(),
  paymentMethod: json['paymentMethod'] as String,
  paymentDate: DateTime.parse(json['paymentDate'] as String),
  notes: json['notes'] as String?,
  createdBy: (json['createdBy'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$PurchasePaymentImplToJson(
  _$PurchasePaymentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'purchaseId': instance.purchaseId,
  'vendorId': instance.vendorId,
  'receiptNumber': instance.receiptNumber,
  'amountPiasters': instance.amountPiasters,
  'paymentMethod': instance.paymentMethod,
  'paymentDate': instance.paymentDate.toIso8601String(),
  'notes': instance.notes,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt.toIso8601String(),
};
