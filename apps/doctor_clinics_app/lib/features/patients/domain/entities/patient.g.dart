// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: (json['id'] as num).toInt(),
      fileNumber: json['fileNumber'] as String,
      fullName: json['fullName'] as String,
      searchText: json['searchText'] as String,
      gender: json['gender'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      phone: json['phone'] as String?,
      phone2: json['phone2'] as String?,
      address: json['address'] as String?,
      occupation: json['occupation'] as String?,
      notes: json['notes'] as String?,
      bloodType: json['bloodType'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileNumber': instance.fileNumber,
      'fullName': instance.fullName,
      'searchText': instance.searchText,
      'gender': instance.gender,
      'birthDate': instance.birthDate?.toIso8601String(),
      'phone': instance.phone,
      'phone2': instance.phone2,
      'address': instance.address,
      'occupation': instance.occupation,
      'notes': instance.notes,
      'bloodType': instance.bloodType,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
