import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppointmentStatusStyle {
  const AppointmentStatusStyle({
    required this.color,
    required this.background,
    required this.labelKey,
  });

  final Color color;
  final Color background;
  final String labelKey;

  /// Palette for one appointment row / month chip.
  ///
  /// Colors resolve from the brightness-aware tokens in core so the rows adapt
  /// to light/dark from a single source.
  static AppointmentStatusStyle forStatus(
    BuildContext context,
    String status,
  ) {
    switch (status) {
      case AppConstants.appointmentStatusInConsultation:
        return AppointmentStatusStyle(
          color: context.clinicStatusCurrent,
          background: context.clinicStatusCurrentBg,
          labelKey: 'appointment_status.in_consultation',
        );
      case AppConstants.appointmentStatusDone:
        return AppointmentStatusStyle(
          color: context.clinicStatusDone,
          background: context.clinicStatusDoneBg,
          labelKey: 'appointment_status.done',
        );
      case AppConstants.appointmentStatusCancelled:
        return AppointmentStatusStyle(
          color: context.clinicStatusCancelled,
          background: context.clinicStatusCancelledBg,
          labelKey: 'appointment_status.cancelled',
        );
      case AppConstants.appointmentStatusNoShow:
        return AppointmentStatusStyle(
          color: context.clinicStatusCancelled,
          background: context.clinicStatusCancelledBg,
          labelKey: 'appointment_status.no_show',
        );
      default:
        return AppointmentStatusStyle(
          color: context.clinicStatusBooked,
          background: context.clinicStatusBookedBg,
          labelKey: 'appointment_status.booked',
        );
    }
  }
}
