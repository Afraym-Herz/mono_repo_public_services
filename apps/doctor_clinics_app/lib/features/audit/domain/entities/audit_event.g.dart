// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditEventImpl _$$AuditEventImplFromJson(Map<String, dynamic> json) =>
    _$AuditEventImpl(
      id: (json['id'] as num).toInt(),
      action: json['action'] as String,
      entityType: json['entityType'] as String,
      entityId: (json['entityId'] as num).toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      oldValue: json['oldValue'] as String?,
      newValue: json['newValue'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AuditEventImplToJson(_$AuditEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'userId': instance.userId,
      'oldValue': instance.oldValue,
      'newValue': instance.newValue,
      'createdAt': instance.createdAt.toIso8601String(),
    };
