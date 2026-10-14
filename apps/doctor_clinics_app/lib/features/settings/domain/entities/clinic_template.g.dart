// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicTemplateImpl _$$ClinicTemplateImplFromJson(Map<String, dynamic> json) =>
    _$ClinicTemplateImpl(
      id: (json['id'] as num).toInt(),
      clinicNameAr: json['clinicNameAr'] as String,
      clinicNameEn: json['clinicNameEn'] as String?,
      doctorNameAr: json['doctorNameAr'] as String,
      doctorNameEn: json['doctorNameEn'] as String?,
      specialtyAr: json['specialtyAr'] as String?,
      specialtyEn: json['specialtyEn'] as String?,
      qualificationsAr: json['qualificationsAr'] as String?,
      qualificationsEn: json['qualificationsEn'] as String?,
      phone: json['phone'] as String?,
      phone2: json['phone2'] as String?,
      addressAr: json['addressAr'] as String?,
      addressEn: json['addressEn'] as String?,
      logoPath: json['logoPath'] as String?,
      headerText: json['headerText'] as String?,
      footerText: json['footerText'] as String?,
      printLanguage: json['printLanguage'] as String,
      paperSize: json['paperSize'] as String,
      marginTop: (json['marginTop'] as num?)?.toInt(),
      marginBottom: (json['marginBottom'] as num?)?.toInt(),
      marginLeft: (json['marginLeft'] as num?)?.toInt(),
      marginRight: (json['marginRight'] as num?)?.toInt(),
      fontSize: (json['fontSize'] as num?)?.toInt(),
      bottomNotes: json['bottomNotes'] as String?,
      defaultConsultationFeePiasters:
          (json['defaultConsultationFeePiasters'] as num?)?.toInt(),
      workingDays: json['workingDays'] as String?,
      slotLengthMinutes: (json['slotLengthMinutes'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ClinicTemplateImplToJson(
  _$ClinicTemplateImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'clinicNameAr': instance.clinicNameAr,
  'clinicNameEn': instance.clinicNameEn,
  'doctorNameAr': instance.doctorNameAr,
  'doctorNameEn': instance.doctorNameEn,
  'specialtyAr': instance.specialtyAr,
  'specialtyEn': instance.specialtyEn,
  'qualificationsAr': instance.qualificationsAr,
  'qualificationsEn': instance.qualificationsEn,
  'phone': instance.phone,
  'phone2': instance.phone2,
  'addressAr': instance.addressAr,
  'addressEn': instance.addressEn,
  'logoPath': instance.logoPath,
  'headerText': instance.headerText,
  'footerText': instance.footerText,
  'printLanguage': instance.printLanguage,
  'paperSize': instance.paperSize,
  'marginTop': instance.marginTop,
  'marginBottom': instance.marginBottom,
  'marginLeft': instance.marginLeft,
  'marginRight': instance.marginRight,
  'fontSize': instance.fontSize,
  'bottomNotes': instance.bottomNotes,
  'defaultConsultationFeePiasters': instance.defaultConsultationFeePiasters,
  'workingDays': instance.workingDays,
  'slotLengthMinutes': instance.slotLengthMinutes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
