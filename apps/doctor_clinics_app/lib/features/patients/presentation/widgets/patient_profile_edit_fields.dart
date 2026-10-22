import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_profile_edit_controller.dart';
import 'patient_profile_blood_type_field.dart';
import 'patient_profile_edit_field.dart';
import 'patient_profile_gender_field.dart';

/// Pencil-mode editors for the profile's six fields.
class PatientProfileEditFields extends StatelessWidget {
  const PatientProfileEditFields({super.key, required this.controller});

  final PatientProfileEditController controller;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PatientProfileEditField(
            controller: controller.name,
            label: 'patient_profile.name'.tr(),
            icon: Icons.person_outline_rounded,
            validator: AppValidators.required,
            textInputAction: TextInputAction.next,
          ),
          gap,
          PatientProfileGenderField(controller: controller),
          gap,
          PatientProfileEditField(
            controller: controller.age,
            label: 'patient_profile.age'.tr(),
            hint: 'patient_form.age_hint'.tr(),
            icon: Icons.cake_outlined,
            keyboardType: TextInputType.number,
            validator: _validateAge,
            textInputAction: TextInputAction.next,
          ),
          gap,
          PatientProfileBloodTypeField(controller: controller),
          gap,
          PatientProfileEditField(
            controller: controller.phone,
            label: 'patient_profile.phone'.tr(),
            hint: 'patient_form.phone_hint'.tr(),
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          gap,
          PatientProfileEditField(
            controller: controller.notes,
            label: 'patient_profile.notes'.tr(),
            hint: 'patient_form.notes_hint'.tr(),
            icon: Icons.edit_note_rounded,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  String? _validateAge(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return null;
    final age = int.tryParse(trimmed);
    return age == null || age < 0 || age > 150
        ? 'patient_form.invalid_age'.tr()
        : null;
  }
}
