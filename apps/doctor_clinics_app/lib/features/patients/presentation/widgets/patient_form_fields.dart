import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_form_controller.dart';
import 'patient_form_contact_fields.dart';
import 'patient_form_identity_fields.dart';

/// Scrollable body of the new-patient modal.
class PatientFormFields extends StatelessWidget {
  const PatientFormFields({super.key, required this.controller});

  final PatientFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PatientFormIdentityFields(controller: controller),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        PatientFormContactFields(controller: controller),
      ],
    );
  }
}
