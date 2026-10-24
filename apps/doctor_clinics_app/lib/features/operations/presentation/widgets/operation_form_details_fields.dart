import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_schedule_fields.dart';

/// Operation name, surgeon and schedule fields.
class OperationFormDetailsFields extends StatelessWidget {
  const OperationFormDetailsFields({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          controller: controller.name,
          label: 'operation_form.name'.tr(),
          hint: 'operation_form.name_hint'.tr(),
          prefixIcon: Icons.medical_services_outlined,
          validator: AppValidators.required,
          textInputAction: TextInputAction.next,
          autofocus: true,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: controller.surgeon,
          label: 'operation_form.surgeon'.tr(),
          hint: 'operation_form.surgeon_hint'.tr(),
          prefixIcon: Icons.person_outline_rounded,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        OperationFormScheduleFields(controller: controller),
      ],
    );
  }
}
