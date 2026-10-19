import 'package:flutter/material.dart';

/// Ticket ("رقم الدور") ordering offered by the queue list head.
enum QueueSortOrder {
  ticketAscending(
    labelKey: 'queue_sort.ticket_ascending',
    icon: Icons.arrow_upward_rounded,
  ),
  ticketDescending(
    labelKey: 'queue_sort.ticket_descending',
    icon: Icons.arrow_downward_rounded,
  );

  const QueueSortOrder({required this.labelKey, required this.icon});

  /// `.tr()` key for the sort pill caption.
  final String labelKey;

  /// Direction marker inside the sort pill.
  final IconData icon;

  /// Reverse ordering, applied when the sort pill is tapped.
  QueueSortOrder get flipped => this == QueueSortOrder.ticketAscending
      ? QueueSortOrder.ticketDescending
      : QueueSortOrder.ticketAscending;
}
