// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_required_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationRequiredTestImpl _$$OperationRequiredTestImplFromJson(
  Map<String, dynamic> json,
) => _$OperationRequiredTestImpl(
  id: (json['id'] as num).toInt(),
  operationId: (json['operationId'] as num).toInt(),
  testName: json['testName'] as String,
  isDone: json['isDone'] as bool?,
  result: json['result'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$OperationRequiredTestImplToJson(
  _$OperationRequiredTestImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'operationId': instance.operationId,
  'testName': instance.testName,
  'isDone': instance.isDone,
  'result': instance.result,
  'notes': instance.notes,
};
