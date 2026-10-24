// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationImpl _$$OperationImplFromJson(Map<String, dynamic> json) =>
    _$OperationImpl(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      name: json['name'] as String,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      scheduledTime: json['scheduledTime'] as String?,
      surgeonName: json['surgeonName'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String?,
      depositPiasters: (json['depositPiasters'] as num?)?.toInt(),
      totalCostPiasters: (json['totalCostPiasters'] as num?)?.toInt(),
      createdBy: (json['createdBy'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$OperationImplToJson(_$OperationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'name': instance.name,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'scheduledTime': instance.scheduledTime,
      'surgeonName': instance.surgeonName,
      'notes': instance.notes,
      'status': instance.status,
      'depositPiasters': instance.depositPiasters,
      'totalCostPiasters': instance.totalCostPiasters,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
