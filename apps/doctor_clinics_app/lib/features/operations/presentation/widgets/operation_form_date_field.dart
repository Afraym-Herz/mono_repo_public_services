import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_picker_button.dart';

/// Scheduled-date picker of the new-operation form.
class OperationFormDateField extends StatelessWidget {
  const OperationFormDateField({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: controller.date,
      builder: (context, date, _) => OperationFormPickerButton(
        label: 'operation_form.date'.tr(),
        value: DateConverter.localizedFullDate(date, context.locale.toString()),
        icon: Icons.event_outlined,
        onTap: () => _pick(context),
      ),
    );
  }

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final current = controller.date.value;
    final picked = await showDatePicker(
      context: context,
      initialDate: current.isBefore(today) ? today : current,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );
    if (picked == null) return;
    controller.date.value = DateTime(picked.year, picked.month, picked.day);
  }
}
