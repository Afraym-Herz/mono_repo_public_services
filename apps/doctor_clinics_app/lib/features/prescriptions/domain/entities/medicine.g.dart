// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicineImpl _$$MedicineImplFromJson(Map<String, dynamic> json) =>
    _$MedicineImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      alias: json['alias'] as String?,
      searchText: json['searchText'] as String?,
      defaultDosage: json['defaultDosage'] as String?,
      defaultFrequency: json['defaultFrequency'] as String?,
      defaultDuration: json['defaultDuration'] as String?,
      defaultInstructions: json['defaultInstructions'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$MedicineImplToJson(_$MedicineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'searchText': instance.searchText,
      'defaultDosage': instance.defaultDosage,
      'defaultFrequency': instance.defaultFrequency,
      'defaultDuration': instance.defaultDuration,
      'defaultInstructions': instance.defaultInstructions,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
