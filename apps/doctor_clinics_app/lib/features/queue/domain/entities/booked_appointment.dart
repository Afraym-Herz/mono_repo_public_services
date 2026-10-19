import 'package:freezed_annotation/freezed_annotation.dart';

part 'booked_appointment.freezed.dart';

@freezed
class BookedAppointment with _$BookedAppointment {
  const factory BookedAppointment({
    required int appointmentId,
    required int patientId,
    required String patientName,
    String? patientPhone,
    String? fileNumber,
    required String scheduledTime,
    required String type,
  }) = _BookedAppointment;
}
