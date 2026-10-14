// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionTemplateImpl _$$PrescriptionTemplateImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionTemplateImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$PrescriptionTemplateImplToJson(
  _$PrescriptionTemplateImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
