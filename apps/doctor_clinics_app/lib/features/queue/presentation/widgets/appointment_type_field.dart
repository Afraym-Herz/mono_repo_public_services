import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Visit kind for a new booking. Day-only bookings never collect a time.
class AppointmentTypeField extends StatelessWidget {
  const AppointmentTypeField({super.key, required this.type});

  final ValueNotifier<String> type;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: type,
      builder: (context, value, _) => AppDropdownField<String>(
        label: 'appointment_sheet.type'.tr(),
        prefixIcon: Icons.medical_information_outlined,
        value: value,
        items: [
          DropdownMenuItem(
            value: AppConstants.appointmentTypeBooked,
            child: Text('appointment_sheet.type_new'.tr()),
          ),
          DropdownMenuItem(
            value: AppConstants.appointmentTypeFollowUp,
            child: Text('appointment_sheet.type_follow_up'.tr()),
          ),
        ],
        onChanged: (next) {
          if (next != null) type.value = next;
        },
      ),
    );
  }
}
