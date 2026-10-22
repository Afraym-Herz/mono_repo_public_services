import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/patient_profile_edit_controller.dart';
import 'patient_profile_edit_dropdown.dart';

/// Editable blood-type dropdown bound to the profile draft.
class PatientProfileBloodTypeField extends StatelessWidget {
  const PatientProfileBloodTypeField({super.key, required this.controller});

  final PatientProfileEditController controller;

  static const _bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller.bloodType,
      builder: (context, bloodType, _) => PatientProfileEditDropdown<String>(
        label: 'patient_profile.blood_type'.tr(),
        value: bloodType ?? '',
        icon: Icons.bloodtype_outlined,
        items: [
          DropdownMenuItem(
            value: '',
            child: Text('patient_form.blood_type_none'.tr()),
          ),
          ..._bloodTypes.map(
            (type) => DropdownMenuItem(value: type, child: Text(type)),
          ),
        ],
        onChanged: (value) => controller.bloodType.value =
            value == null || value.isEmpty ? null : value,
      ),
    );
  }
}
