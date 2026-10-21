import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_form_controller.dart';

/// Contact details plus the optional medical note for the patient file.
class PatientFormContactFields extends StatelessWidget {
  const PatientFormContactFields({super.key, required this.controller});

  final PatientFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          controller: controller.phone,
          label: 'patient_form.phone'.tr(),
          hint: 'patient_form.phone_hint'.tr(),
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: controller.notes,
          label: 'patient_form.notes'.tr(),
          hint: 'patient_form.notes_hint'.tr(),
          maxLines: 3,
        ),
      ],
    );
  }
}
