import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required int id,
    required int patientId,
    required DateTime scheduledDate,
    required String scheduledTime,
    int? queueNumber,
    required String type,
    required String status,
    String? reason,
    String? notes,
    String? cancelledReason,
    @Default(0) int depositPiasters,
    required int createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
