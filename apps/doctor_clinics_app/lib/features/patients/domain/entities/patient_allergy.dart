import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_allergy.freezed.dart';
part 'patient_allergy.g.dart';

@freezed
class PatientAllergy with _$PatientAllergy {
  const factory PatientAllergy({
    required int id,
    required int patientId,
    required String name,
    String? severity,
    String? notes,
  }) = _PatientAllergy;

  factory PatientAllergy.fromJson(Map<String, dynamic> json) =>
      _$PatientAllergyFromJson(json);
}