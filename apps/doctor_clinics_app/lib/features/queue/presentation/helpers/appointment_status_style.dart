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

  static AppointmentStatusStyle forStatus(String status) {
    switch (status) {
      case AppConstants.appointmentStatusInConsultation:
        return const AppointmentStatusStyle(
          color: AppColors.clinicStatusCurrent,
          background: AppColors.clinicStatusCurrentBg,
          labelKey: 'appointment_status.in_consultation',
        );
      case AppConstants.appointmentStatusDone:
        return const AppointmentStatusStyle(
          color: AppColors.clinicStatusDone,
          background: AppColors.clinicStatusDoneBg,
          labelKey: 'appointment_status.done',
        );
      case AppConstants.appointmentStatusCancelled:
        return const AppointmentStatusStyle(
          color: AppColors.clinicStatusCancelled,
          background: AppColors.clinicStatusCancelledBg,
          labelKey: 'appointment_status.cancelled',
        );
      case AppConstants.appointmentStatusNoShow:
        return const AppointmentStatusStyle(
          color: AppColors.clinicStatusCancelled,
          background: AppColors.clinicStatusCancelledBg,
          labelKey: 'appointment_status.no_show',
        );
      default:
        return const AppointmentStatusStyle(
          color: AppColors.clinicStatusBooked,
          background: AppColors.clinicStatusBookedBg,
          labelKey: 'appointment_status.booked',
        );
    }
  }
}
