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

  /// Palette for one queue list card.
  ///
  /// Every color comes from the brightness-aware tokens in core, so the whole
  /// row adapts to light/dark from a single source instead of per-card fixes.
  static QueueRowStyle forRowState(BuildContext context, QueueRowState state) {
    switch (state) {
      case QueueRowState.current:
        return QueueRowStyle(
          surfaceColor: context.clinicStatusCurrentBg,
          borderColor: context.clinicStatusCurrentBorder,
          badgeTextColor: context.clinicStatusCurrent,
          badgeBgColor: context.cardColor,
          labelKey: 'queue_row.status.current',
        );
      case QueueRowState.urgent:
        return QueueRowStyle(
          surfaceColor: context.cardColor,
          borderColor: context.clinicStatusUrgentBorder,
          badgeTextColor: context.clinicStatusUrgent,
          badgeBgColor: context.clinicStatusUrgentBg,
          labelKey: 'queue_row.status.urgent',
        );
      case QueueRowState.waiting:
        return QueueRowStyle(
          surfaceColor: context.cardColor,
          borderColor: context.clinicBorder,
          badgeTextColor: context.clinicStatusWaiting,
          badgeBgColor: context.clinicStatusWaitingBg,
          labelKey: 'queue_row.status.waiting',
        );
      case QueueRowState.done:
        return QueueRowStyle(
          surfaceColor: context.cardColor,
          borderColor: context.clinicBorder,
          badgeTextColor: context.clinicStatusDone,
          badgeBgColor: context.clinicStatusDoneBg,
          labelKey: 'queue_row.status.done',
        );
      case QueueRowState.collected:
        return QueueRowStyle(
          surfaceColor: context.cardColor,
          borderColor: context.clinicBorder,
          badgeTextColor: context.clinicStatusDone,
          badgeBgColor: context.clinicStatusDoneBg,
          labelKey: 'queue_row.status.collected',
        );
      case QueueRowState.cancelled:
        return QueueRowStyle(
          surfaceColor: context.clinicStatusCancelledBg,
          borderColor: context.clinicStatusCancelledBorder,
          badgeTextColor: context.clinicStatusCancelled,
          badgeBgColor: context.clinicStatusCancelledBg,
          labelKey: 'queue_row.status.cancelled',
        );
      case QueueRowState.noShow:
        return QueueRowStyle(
          surfaceColor: context.clinicStatusCancelledBg,
          borderColor: context.clinicStatusCancelledBorder,
          badgeTextColor: context.clinicStatusCancelled,
          badgeBgColor: context.clinicStatusCancelledBg,
          labelKey: 'queue_row.status.no_show',
        );
    }
  }
}
