// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicSettingsImpl _$$ClinicSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ClinicSettingsImpl(
      clinicName: json['clinicName'] as String,
      language: json['language'] as String,
      paperSize: json['paperSize'] as String,
      receiptMargin: (json['receiptMargin'] as num).toInt(),
    );

Map<String, dynamic> _$$ClinicSettingsImplToJson(
  _$ClinicSettingsImpl instance,
) => <String, dynamic>{
  'clinicName': instance.clinicName,
  'language': instance.language,
  'paperSize': instance.paperSize,
  'receiptMargin': instance.receiptMargin,
};
