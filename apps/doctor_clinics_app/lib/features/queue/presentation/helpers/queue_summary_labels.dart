import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../domain/entities/queue_ticket.dart';
import 'queue_format.dart';

/// Localized copy shared by the current-patient summary card.
class QueueSummaryLabels {
  QueueSummaryLabels._();

  /// Room line, appending the clinic template's doctor when available.
  static String room(BuildContext context, String doctorName) {
    final room = 'queue_summary.in_exam_room'.tr();
    if (doctorName.isEmpty) return room;
    final withDoctor = 'queue_summary.with_doctor'.tr(
      namedArgs: {'doctor': doctorName}, // convention-ok: named-argument key.
    );
    return '$room $withDoctor';
  }

  /// Time elapsed since the patient was called into the room.
  static String elapsed(BuildContext context, QueueTicket ticket) {
    final elapsed = DateTime.now()
        .difference(ticket.calledAt ?? ticket.arrivedAt)
        .inMinutes;
    final minutes = elapsed < 0 ? 0 : elapsed;
    return 'queue_summary.for_minutes'.tr(
      namedArgs: {'minutes': QueueFormat.localizedNumber(minutes, context)},
    );
  }
}
