// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_signs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VitalSignsImpl _$$VitalSignsImplFromJson(Map<String, dynamic> json) =>
    _$VitalSignsImpl(
      id: (json['id'] as num).toInt(),
      consultationId: (json['consultationId'] as num).toInt(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      heightCm: (json['heightCm'] as num?)?.toDouble(),
      bpSystolic: (json['bpSystolic'] as num?)?.toInt(),
      bpDiastolic: (json['bpDiastolic'] as num?)?.toInt(),
      pulse: (json['pulse'] as num?)?.toInt(),
      temperatureC: (json['temperatureC'] as num?)?.toDouble(),
      spo2: (json['spo2'] as num?)?.toInt(),
      bloodSugar: (json['bloodSugar'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$VitalSignsImplToJson(_$VitalSignsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'consultationId': instance.consultationId,
      'weightKg': instance.weightKg,
      'heightCm': instance.heightCm,
      'bpSystolic': instance.bpSystolic,
      'bpDiastolic': instance.bpDiastolic,
      'pulse': instance.pulse,
      'temperatureC': instance.temperatureC,
      'spo2': instance.spo2,
      'bloodSugar': instance.bloodSugar,
      'notes': instance.notes,
    };
