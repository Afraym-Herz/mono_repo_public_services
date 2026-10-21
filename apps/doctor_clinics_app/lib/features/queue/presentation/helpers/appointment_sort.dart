import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';

/// Day order = permanent ticket number. Rows without a number (legacy data)
/// fall to the end and keep their insertion order.
List<AppointmentListItem> sortByQueueNumber(
  Iterable<AppointmentListItem> items,
) {
  final sorted = items.toList();
  sorted.sort((a, b) {
    final left = a.queueNumber ?? 1 << 30;
    final right = b.queueNumber ?? 1 << 30;
    if (left != right) return left.compareTo(right);
    return a.appointmentId.compareTo(b.appointmentId);
  });
  return sorted;
}
