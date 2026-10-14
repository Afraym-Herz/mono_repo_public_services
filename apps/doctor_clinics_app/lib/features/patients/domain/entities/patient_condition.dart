import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_condition.freezed.dart';
part 'patient_condition.g.dart';

@freezed
class PatientCondition with _$PatientCondition {
  const factory PatientCondition({
    required int id,
    required int patientId,
    required String name,
    DateTime? sinceDate,
    String? notes,
  }) = _PatientCondition;

  factory PatientCondition.fromJson(Map<String, dynamic> json) =>
      _$PatientConditionFromJson(json);
}