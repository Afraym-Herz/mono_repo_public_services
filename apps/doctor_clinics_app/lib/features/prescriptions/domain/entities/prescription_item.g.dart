// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionItemImpl _$$PrescriptionItemImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionItemImpl(
  id: (json['id'] as num).toInt(),
  prescriptionId: (json['prescriptionId'] as num).toInt(),
  medicineId: (json['medicineId'] as num).toInt(),
  medicineName: json['medicineName'] as String,
  dosage: json['dosage'] as String,
  frequency: json['frequency'] as String,
  duration: json['duration'] as String,
  instructions: json['instructions'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$PrescriptionItemImplToJson(
  _$PrescriptionItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'prescriptionId': instance.prescriptionId,
  'medicineId': instance.medicineId,
  'medicineName': instance.medicineName,
  'dosage': instance.dosage,
  'frequency': instance.frequency,
  'duration': instance.duration,
  'instructions': instance.instructions,
  'notes': instance.notes,
};
