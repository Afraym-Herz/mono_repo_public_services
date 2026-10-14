// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientConditionImpl _$$PatientConditionImplFromJson(
  Map<String, dynamic> json,
) => _$PatientConditionImpl(
  id: (json['id'] as num).toInt(),
  patientId: (json['patientId'] as num).toInt(),
  name: json['name'] as String,
  sinceDate: json['sinceDate'] == null
      ? null
      : DateTime.parse(json['sinceDate'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$PatientConditionImplToJson(
  _$PatientConditionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'name': instance.name,
  'sinceDate': instance.sinceDate?.toIso8601String(),
  'notes': instance.notes,
};
