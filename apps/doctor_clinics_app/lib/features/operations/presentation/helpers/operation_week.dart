import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// One cell of the "operations this week" strip.
class OperationWeekDay {
  const OperationWeekDay({
    required this.date,
    required this.count,
    required this.isToday,
  });

  final DateTime date;
  final int count;
  final bool isToday;
}

/// Builds the current Sunday-to-Saturday week with a count per day.
///
/// Operations outside the current week are ignored here; the main list and the
/// status tabs still expose them.
List<OperationWeekDay> operationWeekDays(
  List<OperationEntry> entries, {
  DateTime? now,
}) {
  final clock = now ?? DateTime.now();
  final today = DateTime(clock.year, clock.month, clock.day);
  final start = today.subtract(Duration(days: clock.weekday % 7));
  final counts = <String, int>{};

  for (final entry in entries) {
    final date = entry.operation.scheduledDate;
    final key = '${date.year}-${date.month}-${date.day}';
    counts[key] = (counts[key] ?? 0) + 1;
  }

  final days = <OperationWeekDay>[];
  for (var offset = 0; offset < 7; offset++) {
    final date = start.add(Duration(days: offset));
    days.add(
      OperationWeekDay(
        date: date,
        count: counts['${date.year}-${date.month}-${date.day}'] ?? 0,
        isToday: _isSameDay(date, today),
      ),
    );
  }
  return days;
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
