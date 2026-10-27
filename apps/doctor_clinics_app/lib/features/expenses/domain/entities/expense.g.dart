// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: (json['id'] as num).toInt(),
      category: json['category'] as String,
      description: json['description'] as String,
      amountPiasters: (json['amountPiasters'] as num).toInt(),
      expenseDate: DateTime.parse(json['expenseDate'] as String),
      notes: json['notes'] as String?,
      createdBy: (json['createdBy'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'amountPiasters': instance.amountPiasters,
      'expenseDate': instance.expenseDate.toIso8601String(),
      'notes': instance.notes,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
