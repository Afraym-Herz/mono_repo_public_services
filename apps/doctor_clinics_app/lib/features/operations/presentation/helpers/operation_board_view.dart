import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_stats.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_filter.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_week.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Everything the board computes from the loaded rows for one frame.
class OperationBoardView {
  const OperationBoardView({
    required this.visible,
    required this.counts,
    required this.stats,
    required this.week,
  });

  /// Rows matching the active status tab and week-day focus.
  final List<OperationEntry> visible;

  /// Entry count per status tab.
  final Map<OperationFilter, int> counts;

  /// Header / sidebar aggregates.
  final OperationBoardStats stats;

  /// Current week cells with their operation counts.
  final List<OperationWeekDay> week;

  factory OperationBoardView.of({
    required List<OperationEntry> entries,
    required OperationFilter filter,
    DateTime? focusedDay,
  }) {
    return OperationBoardView(
      visible: applyOperationFilter(entries, filter, day: focusedDay),
      counts: operationFilterCounts(entries),
      stats: OperationBoardStats.from(entries),
      week: operationWeekDays(entries),
    );
  }
}
