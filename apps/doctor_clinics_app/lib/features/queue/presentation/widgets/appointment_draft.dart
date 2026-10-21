import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';

/// Values collected by the booking sheet and handed to the cubit.
class AppointmentDraft {
  const AppointmentDraft({
    required this.patientId,
    required this.date,
    this.type = AppConstants.appointmentTypeBooked,
    this.reason,
    this.notes,
  });

  factory AppointmentDraft.fromController(
    AppointmentBookingController controller,
    Patient patient,
  ) {
    final reason = controller.reason.text.trim();
    final notes = controller.notes.text.trim();
    return AppointmentDraft(
      patientId: patient.id,
      date: controller.date.value,
      type: controller.isWalkIn
          ? AppConstants.appointmentTypeWalkIn
          : controller.type.value,
      reason: reason.isEmpty ? null : reason,
      notes: notes.isEmpty ? null : notes,
    );
  }

  final int patientId;
  final DateTime date;
  final String type;
  final String? reason;
  final String? notes;
}
