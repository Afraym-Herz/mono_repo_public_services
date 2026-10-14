// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueueEntryImpl _$$QueueEntryImplFromJson(Map<String, dynamic> json) =>
    _$QueueEntryImpl(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$QueueEntryImplToJson(_$QueueEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'status': instance.status,
    };
