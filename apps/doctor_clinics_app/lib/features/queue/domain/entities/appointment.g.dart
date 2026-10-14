// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      scheduledTime: json['scheduledTime'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      reason: json['reason'] as String?,
      notes: json['notes'] as String?,
      cancelledReason: json['cancelledReason'] as String?,
      createdBy: (json['createdBy'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppointmentImplToJson(_$AppointmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'scheduledTime': instance.scheduledTime,
      'type': instance.type,
      'status': instance.status,
      'reason': instance.reason,
      'notes': instance.notes,
      'cancelledReason': instance.cancelledReason,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
