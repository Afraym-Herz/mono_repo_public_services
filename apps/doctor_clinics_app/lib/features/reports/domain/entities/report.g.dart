// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  fromDate: DateTime.parse(json['fromDate'] as String),
  toDate: DateTime.parse(json['toDate'] as String),
  format: json['format'] as String,
  filePath: json['filePath'] as String?,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  generatedBy: (json['generatedBy'] as num).toInt(),
);

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'fromDate': instance.fromDate.toIso8601String(),
      'toDate': instance.toDate.toIso8601String(),
      'format': instance.format,
      'filePath': instance.filePath,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'generatedBy': instance.generatedBy,
    };
