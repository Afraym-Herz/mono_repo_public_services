import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_patient_dropdown.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Registered-patient picker for the new-operation form.
class OperationFormPatientField extends StatelessWidget {
  const OperationFormPatientField({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.patientsLoaded,
      builder: (context, loaded, _) => ValueListenableBuilder<List<Patient>>(
        valueListenable: controller.patients,
        builder: (context, patients, _) => ValueListenableBuilder<int?>(
          valueListenable: controller.patientId,
          builder: (context, selectedId, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OperationFormPatientDropdown(
                controller: controller,
                patients: patients,
                selectedId: selectedId,
                loaded: loaded,
              ),
              if (!loaded) ...[
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                const LinearProgressIndicator(),
              ],
              if (loaded && patients.isEmpty) ...[
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                Text(
                  'operation_form.no_patients_hint'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.clinicTextSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
