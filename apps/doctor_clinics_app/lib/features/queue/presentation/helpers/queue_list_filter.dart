import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';

/// Status tabs docked at the head of the queue list.
enum QueueListFilter {
  all(labelKey: 'queue_filter.all'),
  waiting(
    labelKey: 'queue_filter.waiting',
    status: AppConstants.queueStatusWaiting,
  ),
  inConsultation(
    labelKey: 'queue_filter.in_consultation',
    status: AppConstants.queueStatusInConsultation,
  ),
  done(labelKey: 'queue_filter.done', status: AppConstants.queueStatusDone),
  cancelled(
    labelKey: 'queue_filter.cancelled',
    status: AppConstants.queueStatusCancelled,
  );

  const QueueListFilter({required this.labelKey, this.status});

  final String labelKey;
  final String? status;

  bool matchesStatus(QueueStatus queueStatus) =>
      status == null || status == queueStatus.code;

  static Map<QueueListFilter, int> countByTab(
    List<QueueTicket> tickets, {
    int bookedCount = 0,
  }) => {
    for (final f in values)
      f: tickets.where((t) => f.matchesStatus(t.status)).length +
          (f == all || f == waiting ? bookedCount : 0),
  };
}
