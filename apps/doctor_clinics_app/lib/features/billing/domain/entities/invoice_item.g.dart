// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceItemImpl _$$InvoiceItemImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceItemImpl(
      id: (json['id'] as num).toInt(),
      invoiceId: (json['invoiceId'] as num).toInt(),
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPricePiasters: (json['unitPricePiasters'] as num).toInt(),
      totalPiasters: (json['totalPiasters'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$InvoiceItemImplToJson(_$InvoiceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'description': instance.description,
      'quantity': instance.quantity,
      'unitPricePiasters': instance.unitPricePiasters,
      'totalPiasters': instance.totalPiasters,
      'notes': instance.notes,
    };
