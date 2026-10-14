// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackupInfoImpl _$$BackupInfoImplFromJson(Map<String, dynamic> json) =>
    _$BackupInfoImpl(
      filePath: json['filePath'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      sizeBytes: (json['sizeBytes'] as num).toInt(),
      schemaVersion: json['schemaVersion'] as String,
    );

Map<String, dynamic> _$$BackupInfoImplToJson(_$BackupInfoImpl instance) =>
    <String, dynamic>{
      'filePath': instance.filePath,
      'createdAt': instance.createdAt.toIso8601String(),
      'sizeBytes': instance.sizeBytes,
      'schemaVersion': instance.schemaVersion,
    };
