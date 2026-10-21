import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/queue_status.dart';
import '../../domain/entities/queue_ticket.dart';

/// Derived text for a queue card: the contact/file line and the live wait time.
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

  /// Wait time for live patients. Booked times are intentionally not shown:
  /// appointments are day-only now.
  static String? timing(BuildContext context, QueueTicket ticket) {
    if (ticket.status != QueueStatus.waiting &&
        ticket.status != QueueStatus.inConsultation) {
      return null;
    }
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    if (ticket.arrivedAt.isBefore(startOfDay)) return null;
    final minutes = now.difference(ticket.arrivedAt).inMinutes;
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
}
