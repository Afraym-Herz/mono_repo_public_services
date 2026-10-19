import 'package:flutter/material.dart';

import '../../domain/entities/queue_ticket.dart';
import 'queue_summary_current_body.dart';
import 'queue_summary_current_empty.dart';
import 'queue_summary_surface.dart';

/// Card describing the patient currently being examined.
class QueueSummaryCurrentCard extends StatelessWidget {
  const QueueSummaryCurrentCard({
    super.key,
    required this.ticket,
    this.doctorName = '',
  });

  final QueueTicket? ticket;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    final current = ticket;
    return QueueSummarySurface(
      child: current == null
          ? const QueueSummaryCurrentEmpty()
          : QueueSummaryCurrentBody(ticket: current, doctorName: doctorName),
    );
  }
}
