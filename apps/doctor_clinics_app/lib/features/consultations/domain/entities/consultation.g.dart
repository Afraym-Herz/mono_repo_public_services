// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationImpl _$$ConsultationImplFromJson(Map<String, dynamic> json) =>
    _$ConsultationImpl(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      queueEntryId: (json['queueEntryId'] as num?)?.toInt(),
      visitDate: DateTime.parse(json['visitDate'] as String),
      chiefComplaint: json['chiefComplaint'] as String?,
      historyOfPresentIllness: json['historyOfPresentIllness'] as String?,
      examinationNotes: json['examinationNotes'] as String?,
      diagnosis: json['diagnosis'] as String?,
      treatmentPlan: json['treatmentPlan'] as String?,
      followUpDate: json['followUpDate'] == null
          ? null
          : DateTime.parse(json['followUpDate'] as String),
      followUpNotes: json['followUpNotes'] as String?,
      status: json['status'] as String,
      createdBy: (json['createdBy'] as num).toInt(),
      finalizedAt: json['finalizedAt'] == null
          ? null
          : DateTime.parse(json['finalizedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$ConsultationImplToJson(_$ConsultationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'queueEntryId': instance.queueEntryId,
      'visitDate': instance.visitDate.toIso8601String(),
      'chiefComplaint': instance.chiefComplaint,
      'historyOfPresentIllness': instance.historyOfPresentIllness,
      'examinationNotes': instance.examinationNotes,
      'diagnosis': instance.diagnosis,
      'treatmentPlan': instance.treatmentPlan,
      'followUpDate': instance.followUpDate?.toIso8601String(),
      'followUpNotes': instance.followUpNotes,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'finalizedAt': instance.finalizedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
