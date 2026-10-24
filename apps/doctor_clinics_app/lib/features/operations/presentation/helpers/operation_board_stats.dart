import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Aggregate figures shown above and beside the operations board.
class OperationBoardStats {
  const OperationBoardStats({
    required this.total,
    required this.today,
    required this.upcoming,
    required this.completed,
    required this.cancelled,
    required this.testsPending,
    required this.unassignedSurgeon,
    required this.outstandingBalance,
  });

  final int total;
  final int today;
  final int upcoming;
  final int completed;
  final int cancelled;
  final int testsPending;
  final int unassignedSurgeon;
  final int outstandingBalance;

  /// Derives every figure from the loaded board rows.
  factory OperationBoardStats.from(List<OperationEntry> entries) {
    final now = DateTime.now();
    var today = 0;
    var upcoming = 0;
    var completed = 0;
    var cancelled = 0;
    var testsPending = 0;
    var unassignedSurgeon = 0;
    var outstandingBalance = 0;

    for (final entry in entries) {
      final date = entry.operation.scheduledDate;
      final isToday =
          date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
      if (isToday) today++;
      if (entry.operation.status == AppConstants.operationStatusScheduled &&
          !date.isBefore(DateTime(now.year, now.month, now.day))) {
        upcoming++;
      }
      if (entry.operation.status == AppConstants.operationStatusCompleted) {
        completed++;
      }
      if (entry.operation.status == AppConstants.operationStatusCancelled) {
        cancelled++;
      }
      testsPending += entry.testsPending;
      if (entry.isSurgeonMissing) unassignedSurgeon++;
      if (entry.hasBalance) outstandingBalance++;
    }

    return OperationBoardStats(
      total: entries.length,
      today: today,
      upcoming: upcoming,
      completed: completed,
      cancelled: cancelled,
      testsPending: testsPending,
      unassignedSurgeon: unassignedSurgeon,
      outstandingBalance: outstandingBalance,
    );
  }
}
