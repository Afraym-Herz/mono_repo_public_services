import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Status tabs of the operations board.
enum OperationFilter {
  all('operations_board.filter.all'),
  today('operations_board.filter.today'),
  upcoming('operations_board.filter.upcoming'),
  completed('operations_board.filter.completed'),
  cancelled('operations_board.filter.cancelled');

  const OperationFilter(this.labelKey);

  /// Translation key rendered by the filter chip.
  final String labelKey;
}

/// Applies [filter] and an optional [day] focus to [entries].
List<OperationEntry> applyOperationFilter(
  List<OperationEntry> entries,
  OperationFilter filter, {
  DateTime? day,
}) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = day == null ? null : DateTime(day.year, day.month, day.day);

  return entries
      .where((entry) {
        if (target != null &&
            !_isSameDay(entry.operation.scheduledDate, target)) {
          return false;
        }
        final status = entry.operation.status;
        final date = entry.operation.scheduledDate;
        return switch (filter) {
          OperationFilter.all => true,
          OperationFilter.today => _isSameDay(date, today),
          OperationFilter.upcoming =>
            status == AppConstants.operationStatusScheduled &&
                !DateTime(date.year, date.month, date.day).isBefore(today),
          OperationFilter.completed =>
            status == AppConstants.operationStatusCompleted,
          OperationFilter.cancelled =>
            status == AppConstants.operationStatusCancelled,
        };
      })
      .toList(growable: false);
}

/// Entry count per tab, used by the filter strip.
Map<OperationFilter, int> operationFilterCounts(List<OperationEntry> entries) {
  return {
    for (final filter in OperationFilter.values)
      filter: applyOperationFilter(entries, filter).length,
  };
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
