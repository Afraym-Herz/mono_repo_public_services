import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/patient_list_cubit.dart';
import 'patient_form_dialog.dart';
import 'patients_header.dart';

/// [PatientsHeader] bound to [PatientListCubit].
///
/// The header reads the live patient count straight from the loaded register,
/// so it updates after adding, editing or deleting a record. Creation opens the
/// shared patient form; export is still a placeholder until that flow lands.
class PatientsHeaderConnected extends StatelessWidget {
  const PatientsHeaderConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientListCubit, PatientListState>(
      builder: (context, state) {
        final count = state.maybeMap(
          loaded: (loaded) => loaded.rows.length,
          orElse: () => 0,
        );

        return PatientsHeader(
          patientCount: count,
          onAddPatient: () => _addPatient(context),
          onExport: () => AppSnackBar.showInfo(
            context,
            'patients_header.export_unavailable'.tr(),
          ),
        );
      },
    );
  }

  Future<void> _addPatient(BuildContext context) async {
    final outcome = await showPatientFormDialog(context);
    if (outcome == null || !context.mounted) return;
    if (outcome.created) {
      AppSnackBar.showSuccess(context, 'patient_form.saved'.tr());
    }
    context.read<PatientListCubit>().load();
  }
}
