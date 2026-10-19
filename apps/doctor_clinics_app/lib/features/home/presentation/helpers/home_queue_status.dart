/// Status shown on a home "current queue" row.
///
/// Presentational sample statuses for the dashboard panel; the live queue screen
/// keeps using the [AppConstants] queue status codes.
enum HomeQueueStatus {
  inConsultation(labelKey: 'home_queue_status_in_consultation'),
  waiting(labelKey: 'home_queue_status_waiting'),
  urgent(labelKey: 'home_queue_status_urgent'),
  booked(labelKey: 'home_queue_status_booked'),
  done(labelKey: 'home_queue_status_done');

  const HomeQueueStatus({required this.labelKey});

  /// `.tr()` key for the status chip caption.
  final String labelKey;
}
