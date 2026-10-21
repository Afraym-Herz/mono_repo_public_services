import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';

class AppointmentDatePickerRow extends StatelessWidget {
  const AppointmentDatePickerRow({super.key, required this.date});

  final ValueNotifier<DateTime> date;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: date,
      builder: (context, value, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'appointment_sheet.date'.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: context.clinicTextSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          AppButton(
            label: DateConverter.localizedFullDate(
              value,
              context.locale.toString(),
            ),
            icon: Icons.calendar_month_outlined,
            outlined: true,
            height: Dimensions.CONTROL_HEIGHT.h,
            onPressed: () => _pick(context),
          ),
        ],
      ),
    );
  }

  Future<void> _pick(BuildContext context) async {
    final today = AppointmentCalendar.dayOf(DateTime.now());
    final initial = date.value.isBefore(today) ? today : date.value;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );
    if (picked != null) date.value = AppointmentCalendar.dayOf(picked);
  }
}
