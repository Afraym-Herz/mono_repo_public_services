import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Weekday labels above the month grid. [days] is the grid's first week, so the
/// columns stay Saturday-first like the appointment calendar math.
class AppointmentMonthWeekdays extends StatelessWidget {
  const AppointmentMonthWeekdays({super.key, required this.days});

  final List<DateTime> days;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(
      color: context.clinicTextSecondary,
      fontWeight: FontWeight.w700,
    );
    return Row(
      children: [
        for (final day in days)
          Expanded(
            child: Center(
              child: Text(
                DateConverter.localizedWeekdayShort(day, locale),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
            ),
          ),
      ],
    );
  }
}
