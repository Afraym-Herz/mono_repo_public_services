import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_picker_button.dart';

/// Optional scheduled-time picker of the new-operation form.
class OperationFormTimeField extends StatelessWidget {
  const OperationFormTimeField({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TimeOfDay?>(
      valueListenable: controller.time,
      builder: (context, time, _) => OperationFormPickerButton(
        label: 'operation_form.time'.tr(),
        value: time == null
            ? 'operation_form.time_none'.tr()
            : DateConverter.localizedTime(
                DateTime(2020, 1, 1, time.hour, time.minute),
                context.locale.toString(),
              ),
        icon: Icons.schedule_outlined,
        onTap: () => _pick(context, time),
      ),
    );
  }

  Future<void> _pick(BuildContext context, TimeOfDay? current) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: current ?? const TimeOfDay(hour: 9, minute: 0),
    );
    if (picked != null) controller.time.value = picked;
  }
}
