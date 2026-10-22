import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_form_controller.dart';
import 'patient_form_age_field.dart';
import 'patient_form_name_field.dart';

/// Name, gender, age and blood type.
class PatientFormIdentityFields extends StatelessWidget {
  const PatientFormIdentityFields({super.key, required this.controller});

  final PatientFormController controller;

  static const _bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PatientFormNameField(controller: controller),
        gap,
        ValueListenableBuilder<String>(
          valueListenable: controller.gender,
          builder: (context, gender, _) => AppDropdownField<String>(
            label: 'patient_form.gender'.tr(),
            value: gender,
            prefixIcon: Icons.wc_rounded,
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
        ),
        gap,
        PatientFormAgeField(controller: controller),
        gap,
        ValueListenableBuilder<String?>(
          valueListenable: controller.bloodType,
          builder: (context, bloodType, _) => AppDropdownField<String>(
            label: 'patient_form.blood_type'.tr(),
            value: bloodType ?? '',
            prefixIcon: Icons.bloodtype_outlined,
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
        ),
      ],
    );
  }
}
