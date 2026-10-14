// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_allergy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientAllergyImpl _$$PatientAllergyImplFromJson(Map<String, dynamic> json) =>
    _$PatientAllergyImpl(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      name: json['name'] as String,
      severity: json['severity'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$PatientAllergyImplToJson(
  _$PatientAllergyImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'name': instance.name,
  'severity': instance.severity,
  'notes': instance.notes,
};
