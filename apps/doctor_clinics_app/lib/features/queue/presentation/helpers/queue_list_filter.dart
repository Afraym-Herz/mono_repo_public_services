import 'package:core/core.dart';

import '../../domain/entities/queue_entry.dart';

/// Status tabs docked at the head of the queue list.
///
/// Every tab but [all] maps onto an [AppConstants] queue status — the literals
/// stay in `core` (CLAUDE.md: no magic strings for status names). Declaration
/// order is the RTL reading order on screen: الكل → منتظر → في الكشف → تم → ملغي.
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

  /// `.tr()` key for the tab caption.
  final String labelKey;

  /// Queue status this tab keeps, or `null` for [all].
  final String? status;

  /// Whether [entry] belongs under this tab.
  bool matches(QueueEntry entry) => status == null || entry.status == status;

  /// Entry count per tab, keyed by tab (same order as [values]).
  static Map<QueueListFilter, int> countByTab(List<QueueEntry> entries) => {
    for (final filter in values) filter: entries.where(filter.matches).length,
  };
}
