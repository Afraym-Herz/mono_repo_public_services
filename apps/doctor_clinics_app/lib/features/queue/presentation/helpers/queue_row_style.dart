import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'queue_row_state.dart';

class QueueRowStyle {
  final Color surfaceColor;
  final Color borderColor;
  final Color badgeTextColor;
  final Color badgeBgColor;
  final String labelKey;

  const QueueRowStyle({
    required this.surfaceColor,
    required this.borderColor,
    required this.badgeTextColor,
    required this.badgeBgColor,
    required this.labelKey,
  });

  static QueueRowStyle forRowState(QueueRowState state) {
    switch (state) {
      case QueueRowState.current:
        return const QueueRowStyle(
          surfaceColor: AppColors.clinicStatusCurrentBg,
          borderColor: AppColors.clinicStatusCurrentBorder,
          badgeTextColor: AppColors.clinicStatusCurrent,
          badgeBgColor: AppColors.surfaceWhite,
          labelKey: 'queue_row.status.current',
        );
      case QueueRowState.urgent:
        return const QueueRowStyle(
          surfaceColor: AppColors.surfaceWhite,
          borderColor: AppColors.clinicStatusUrgentBorder,
          badgeTextColor: AppColors.clinicStatusUrgent,
          badgeBgColor: AppColors.clinicStatusUrgentBg,
          labelKey: 'queue_row.status.urgent',
        );
      case QueueRowState.waiting:
        return const QueueRowStyle(
          surfaceColor: AppColors.surfaceWhite,
          borderColor: AppColors.clinicBorder,
          badgeTextColor: AppColors.clinicStatusWaiting,
          badgeBgColor: AppColors.clinicStatusWaitingBg,
          labelKey: 'queue_row.status.waiting',
        );
      case QueueRowState.done:
        return const QueueRowStyle(
          surfaceColor: AppColors.surfaceWhite,
          borderColor: AppColors.clinicBorder,
          badgeTextColor: AppColors.clinicStatusDone,
          badgeBgColor: AppColors.clinicStatusDoneBg,
          labelKey: 'queue_row.status.done',
        );
      case QueueRowState.collected:
        return const QueueRowStyle(
          surfaceColor: AppColors.surfaceWhite,
          borderColor: AppColors.clinicBorder,
          badgeTextColor: AppColors.clinicStatusDone,
          badgeBgColor: AppColors.clinicStatusDoneBg,
          labelKey: 'queue_row.status.collected',
        );
      case QueueRowState.cancelled:
        return const QueueRowStyle(
          surfaceColor: AppColors.clinicStatusCancelledBg,
          borderColor: AppColors.clinicStatusCancelledBorder,
          badgeTextColor: AppColors.clinicStatusCancelled,
          badgeBgColor: AppColors.clinicStatusCancelledBg,
          labelKey: 'queue_row.status.cancelled',
        );
      case QueueRowState.booked:
        return const QueueRowStyle(
          surfaceColor: AppColors.surfaceWhite,
          borderColor: AppColors.clinicBorder,
          badgeTextColor: AppColors.clinicStatusBooked,
          badgeBgColor: AppColors.clinicStatusBookedBg,
          labelKey: 'queue_row.status.booked',
        );
    }
  }
}
