import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_format.dart';
import '../helpers/queue_row_state.dart';

/// Circled ticket number at the leading edge of a queue card.
///
/// Mirrors the home "current queue" badge so both lists read the same: the
/// circle fills with the clinic accent for the patient in consultation, tints
/// error red for urgent tickets, and stays neutral otherwise.
class QueueTicketNumberBadge extends StatelessWidget {
  const QueueTicketNumberBadge({
    super.key,
    required this.number,
    required this.rowState,
    this.isUrgent = false,
  });

  /// Ticket number to render (localized digits).
  final int number;

  /// Row state used to pick the badge tint.
  final QueueRowState rowState;

  /// Whether the ticket is flagged urgent.
  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    final isCurrent = rowState == QueueRowState.current;
    final isUrgentRow = isUrgent || rowState == QueueRowState.urgent;

    final Color background;
    final Color foreground;
    if (isCurrent) {
      background = context.clinicAccent;
      foreground = AppColors.white;
    } else if (isUrgentRow) {
      background = context.clinicStatusUrgentBg;
      foreground = context.clinicStatusUrgent;
    } else {
      background = context.clinicContainer;
      foreground = context.clinicTextSecondary;
    }

    return Container(
      width: Dimensions.ICON_SIZE_LARGE.r,
      height: Dimensions.ICON_SIZE_LARGE.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: background,
        border: isCurrent
            ? null
            : Border.all(
                color: isUrgentRow
                    ? context.clinicStatusUrgentBorder
                    : context.clinicBorder,
              ),
      ),
      child: ResponsiveText(
        QueueFormat.localizedNumber(number, context),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: foreground,
      ),
    );
  }
}
