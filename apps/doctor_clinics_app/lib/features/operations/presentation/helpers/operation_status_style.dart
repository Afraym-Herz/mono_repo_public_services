import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Brightness-aware palette for one operation status chip.
class OperationStatusStyle {
  const OperationStatusStyle({
    required this.color,
    required this.background,
    required this.border,
    required this.labelKey,
  });

  final Color color;
  final Color background;
  final Color border;
  final String labelKey;

  static OperationStatusStyle forStatus(BuildContext context, String? status) {
    switch (status) {
      case AppConstants.operationStatusCompleted:
        return OperationStatusStyle(
          color: context.clinicStatusDone,
          background: context.clinicStatusDoneBg,
          border: context.clinicStatusDoneBorder,
          labelKey: 'operations_board.status.completed',
        );
      case AppConstants.operationStatusCancelled:
        return OperationStatusStyle(
          color: context.clinicStatusCancelled,
          background: context.clinicStatusCancelledBg,
          border: context.clinicStatusCancelledBorder,
          labelKey: 'operations_board.status.cancelled',
        );
      default:
        return OperationStatusStyle(
          color: context.clinicStatusBooked,
          background: context.clinicStatusBookedBg,
          border: context.clinicStatusBookedBorder,
          labelKey: 'operations_board.status.scheduled',
        );
    }
  }
}
