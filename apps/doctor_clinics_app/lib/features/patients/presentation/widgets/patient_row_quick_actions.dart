import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import '../cubit/patient_list_cubit.dart';
import '../helpers/open_patient_profile.dart';
import 'patient_delete_dialog.dart';
import 'patient_row_actions.dart';

/// Binds the row's quick actions to snackbars and the delete confirmation.
class PatientRowQuickActions extends StatelessWidget {
  const PatientRowQuickActions({super.key, required this.row, this.onDelete});

  final PatientListRow row;
  final ValueChanged<PatientListRow>? onDelete;

  @override
  Widget build(BuildContext context) {
    return PatientRowActions(
      onView: () => _view(context),
      onBook: () =>
          AppSnackBar.showInfo(context, 'patients.table.book_unavailable'.tr()),
      onDelete: () => _delete(context),
    );
  }

  Future<void> _view(BuildContext context) async {
    final changed = await openPatientProfile(context, row.patient);
    if (!changed || !context.mounted) return;
    final cubit = context.read<PatientListCubit>();
    if (!cubit.isClosed) await cubit.load();
  }

  Future<void> _delete(BuildContext context) async {
    final confirmed = await PatientDeleteDialog.show(context, row);
    if (confirmed) onDelete?.call(row);
  }
}
