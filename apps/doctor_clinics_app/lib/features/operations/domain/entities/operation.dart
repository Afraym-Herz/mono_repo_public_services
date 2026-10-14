import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation.freezed.dart';
part 'operation.g.dart';

@freezed
class Operation with _$Operation {
  const factory Operation({
    required int id,
    required int patientId,
    required String name,
    required DateTime scheduledDate,
    String? notes,
    String? status,
    int? depositPiasters,
    int? totalCostPiasters,
    required int createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Operation;

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);
}