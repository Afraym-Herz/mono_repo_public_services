import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// "+N" line under the two preview chips in a month day cell.
class AppointmentMonthMore extends StatelessWidget {
  const AppointmentMonthMore({super.key, required this.hidden});

  final int hidden;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    return Text(
      'appointment_month.more'.tr(
        namedArgs: {
          'count': DateConverter.withLocalizedDigits('$hidden', locale),
        },
      ),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: context.clinicTextSecondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
