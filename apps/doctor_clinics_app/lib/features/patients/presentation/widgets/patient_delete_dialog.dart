import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

/// Confirmation dialog for the row's destructive quick action.
class PatientDeleteDialog {
  const PatientDeleteDialog._();

  /// Returns `true` when the user confirms deleting [row]'s patient.
  static Future<bool> show(BuildContext context, PatientListRow row) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('patients.table.delete_title'.tr()),
        content: Text(
          'patients.table.delete_message'.tr(
            namedArgs: {'name': row.patient.fullName},
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text('patients.table.cancel'.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text('patients.table.delete'.tr()),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }
}
