import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation.freezed.dart';
part 'consultation.g.dart';

@freezed
class Consultation with _$Consultation {
  const factory Consultation({
    required int id,
    required int patientId,
    int? queueEntryId,
    required DateTime visitDate,
    String? chiefComplaint,
    String? historyOfPresentIllness,
    String? examinationNotes,
    String? diagnosis,
    String? treatmentPlan,
    DateTime? followUpDate,
    String? followUpNotes,
    required String status,
    required int createdBy,
    DateTime? finalizedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Consultation;

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);
}