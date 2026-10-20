import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/patient_list_cubit.dart';
import 'patients_header.dart';

/// [PatientsHeader] bound to [PatientListCubit].
///
/// The header reads the live patient count straight from the loaded register,
/// so it updates after adding, editing or deleting a record. Export and creation
/// are still placeholders until those flows land.
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
          onAddPatient: () => AppSnackBar.showInfo(
            context,
            'patients_header.form_unavailable'.tr(),
          ),
          onExport: () => AppSnackBar.showInfo(
            context,
            'patients_header.export_unavailable'.tr(),
          ),
        );
      },
    );
  }
}
