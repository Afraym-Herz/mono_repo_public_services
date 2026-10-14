import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_required_test.freezed.dart';
part 'operation_required_test.g.dart';

@freezed
class OperationRequiredTest with _$OperationRequiredTest {
  const factory OperationRequiredTest({
    required int id,
    required int operationId,
    required String testName,
    bool? isDone,
    String? result,
    String? notes,
  }) = _OperationRequiredTest;

  factory OperationRequiredTest.fromJson(
    Map<String, dynamic> json,
  ) => _$OperationRequiredTestFromJson(json);
}