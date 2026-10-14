// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: (json['id'] as num).toInt(),
      invoiceId: (json['invoiceId'] as num).toInt(),
      receiptNumber: json['receiptNumber'] as String,
      amountPiasters: (json['amountPiasters'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      notes: json['notes'] as String?,
      createdBy: (json['createdBy'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'receiptNumber': instance.receiptNumber,
      'amountPiasters': instance.amountPiasters,
      'paymentMethod': instance.paymentMethod,
      'paymentDate': instance.paymentDate.toIso8601String(),
      'notes': instance.notes,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };
