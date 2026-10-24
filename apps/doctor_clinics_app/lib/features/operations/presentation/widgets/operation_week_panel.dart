import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_week.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_week_day_row.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_week_show_all.dart';

/// Sidebar card listing the current week with a count per day.
class OperationWeekPanel extends StatelessWidget {
  const OperationWeekPanel({
    super.key,
    required this.days,
    required this.focusedDay,
    required this.onSelectDay,
    required this.onShowAll,
  });

  final List<OperationWeekDay> days;
  final DateTime? focusedDay;
  final ValueChanged<DateTime> onSelectDay;
  final VoidCallback onShowAll;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'operations_board.week.title'.tr(),
      icon: Icons.date_range_outlined,
      animationDelay: const Duration(milliseconds: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final day in days)
            OperationWeekDayRow(
              day: day,
              isActive: _isFocused(day.date),
              onTap: () => onSelectDay(day.date),
            ),
          if (focusedDay != null) ...[
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            OperationWeekShowAll(onTap: onShowAll),
          ],
        ],
      ),
    );
  }

  bool _isFocused(DateTime date) {
    final focused = focusedDay;
    return focused != null &&
        focused.year == date.year &&
        focused.month == date.month &&
        focused.day == date.day;
  }
}
