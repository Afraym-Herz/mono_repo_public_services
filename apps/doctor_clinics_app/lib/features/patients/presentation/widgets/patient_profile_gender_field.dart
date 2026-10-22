import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/patient_profile_edit_controller.dart';
import 'patient_profile_edit_dropdown.dart';

/// Editable gender dropdown bound to the profile draft.
class PatientProfileGenderField extends StatelessWidget {
  const PatientProfileGenderField({super.key, required this.controller});

  final PatientProfileEditController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: controller.gender,
      builder: (context, gender, _) => PatientProfileEditDropdown<String>(
        label: 'patient_profile.gender'.tr(),
        value: gender,
        icon: Icons.wc_rounded,
        items: [
          DropdownMenuItem(
            value: AppConstants.genderMale,
            child: Text('patient_form.gender_male'.tr()),
          ),
          DropdownMenuItem(
            value: AppConstants.genderFemale,
            child: Text('patient_form.gender_female'.tr()),
          ),
        ],
        onChanged: (value) {
          if (value != null) controller.gender.value = value;
        },
      ),
    );
  }
}
