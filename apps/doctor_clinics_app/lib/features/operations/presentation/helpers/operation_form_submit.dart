import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_form_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_values.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Validates the operation form, then creates or updates the record.
class OperationFormSubmit {
  const OperationFormSubmit._();

  static void run(
    BuildContext context, {
    required OperationFormController controller,
    OperationEntry? entry,
  }) {
    if (controller.patientId.value == null) {
      AppSnackBar.showError(context, 'operation_form.patient_required'.tr());
      return;
    }
    if (!(controller.formKey.currentState?.validate() ?? false)) return;
    final cubit = context.read<OperationFormCubit>();
    final operation = controller.toOperation();
    final testNames = controller.tests.value;
    if (entry == null) {
      cubit.save(operation: operation, testNames: testNames);
    } else {
      cubit.update(operation: operation, testNames: testNames);
    }
  }
}
