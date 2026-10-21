import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_month_count_badge.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_month_day_number.dart';

/// Top line of a month day cell: the localized day number on the leading edge
/// and the booking count on the trailing edge.
class AppointmentMonthDayHeader extends StatelessWidget {
  const AppointmentMonthDayHeader({
    super.key,
    required this.day,
    required this.count,
    required this.isToday,
    required this.isCurrentMonth,
  });

  final DateTime day;
  final int count;
  final bool isToday;
  final bool isCurrentMonth;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    return Row(
      children: [
        AppointmentMonthDayNumber(
          number: DateConverter.withLocalizedDigits('${day.day}', locale),
          isToday: isToday,
          isCurrentMonth: isCurrentMonth,
        ),
        const Spacer(),
        if (count > 0)
          AppointmentMonthCountBadge(
            count: DateConverter.withLocalizedDigits('$count', locale),
          ),
      ],
    );
  }
}
