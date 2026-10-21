import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/patient_form_controller.dart';

/// Optional age input, stored as an approximated birth date.
class PatientFormAgeField extends StatelessWidget {
  const PatientFormAgeField({super.key, required this.controller});

  final PatientFormController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller.age,
      label: 'patient_form.age'.tr(),
      hint: 'patient_form.age_hint'.tr(),
      prefixIcon: Icons.cake_outlined,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: (value) {
        final trimmed = value?.trim() ?? '';
        if (trimmed.isEmpty) return null;
        final age = int.tryParse(trimmed);
        return age == null || age < 0 || age > 150
            ? 'patient_form.invalid_age'.tr()
            : null;
      },
    );
  }
}
