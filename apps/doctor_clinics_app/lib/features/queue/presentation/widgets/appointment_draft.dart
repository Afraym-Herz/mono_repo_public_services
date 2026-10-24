import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'package:doctor_clinics_app/core/helpers/money_input.dart';

/// Values collected by the booking sheet and handed to the cubit.
class AppointmentDraft {
  const AppointmentDraft({
    required this.patientId,
    required this.date,
    this.type = AppConstants.appointmentTypeBooked,
    this.reason,
    this.notes,
    this.depositPiasters = 0,
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
      depositPiasters:
          MoneyInput.tryParsePiasters(controller.deposit.text) ?? 0,
    );
  }

  final int patientId;
  final DateTime date;
  final String type;
  final String? reason;
  final String? notes;
  final int depositPiasters;
}
