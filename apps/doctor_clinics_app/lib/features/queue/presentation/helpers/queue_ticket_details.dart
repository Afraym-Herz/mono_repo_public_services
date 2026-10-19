import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/queue_status.dart';
import '../../domain/entities/queue_ticket.dart';

/// Derived text for a queue card: the contact/file line and the home-style
/// timing detail (wait time for arrived patients, confirmed slot for booked).
class QueueTicketDetails {
  QueueTicketDetails._();

  /// Phone • file number, localized. Null when neither is present.
  static String? extraInfo(BuildContext context, QueueTicket ticket) {
    final locale = context.locale.toString();
    final parts = <String>[];
    final phone = ticket.patientPhone;
    if (phone != null && phone.isNotEmpty) {
      parts.add(DateConverter.withLocalizedDigits(phone, locale));
    }
    final file = ticket.fileNumber;
    if (file != null && file.isNotEmpty) {
      parts.add(
        '${'queue_row.meta.file_number'.tr()} '
        '${DateConverter.withLocalizedDigits(file, locale)}',
      );
    }
    return parts.isEmpty ? null : parts.join('  •  ');
  }

  /// Wait time for arrived patients, or the confirmed slot when the ticket
  /// carries no arrival time.
  static String? timing(BuildContext context, QueueTicket ticket) {
    if (ticket.status == QueueStatus.waiting ||
        ticket.status == QueueStatus.inConsultation) {
      final minutes = DateTime.now().difference(ticket.arrivedAt).inMinutes;
      final safeMinutes = minutes < 0 ? 0 : minutes;
      return 'queue_row.meta.wait'.tr(
        namedArgs: {
          'minutes': DateConverter.withLocalizedDigits(
            '$safeMinutes',
            context.locale.toString(),
          ),
        },
      );
    }
    final scheduled = ticket.scheduledTime;
    if (scheduled != null && scheduled.isNotEmpty) {
      return 'queue_row.meta.scheduled_at'.tr(
        namedArgs: {
          'time': DateConverter.localizedSlot(
            scheduled,
            context.locale.toString(),
          ),
        },
      );
    }
    return null;
  }
}
