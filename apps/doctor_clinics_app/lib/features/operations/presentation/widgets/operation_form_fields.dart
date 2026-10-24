import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_details_fields.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_finance_fields.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_patient_field.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_tests_field.dart';

/// Scrollable body of the new-operation modal.
class OperationFormFields extends StatelessWidget {
  const OperationFormFields({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OperationFormPatientField(controller: controller),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        OperationFormDetailsFields(controller: controller),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        OperationFormFinanceFields(controller: controller),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: controller.notes,
          label: 'operation_form.notes'.tr(),
          hint: 'operation_form.notes_hint'.tr(),
          maxLines: 3,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        OperationFormTestsField(controller: controller),
      ],
    );
  }
}
