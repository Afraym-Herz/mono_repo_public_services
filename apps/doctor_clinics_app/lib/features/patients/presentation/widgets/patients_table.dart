import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/patient_list_cubit.dart';
import 'patients_table_error.dart';
import 'patients_table_loaded.dart';
import 'patients_table_skeleton.dart';

/// Register table bound to [PatientListCubit] and filtered by the toolbar.
class PatientsTable extends StatelessWidget {
  const PatientsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientListCubit>();
    return BlocBuilder<PatientListCubit, PatientListState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (rows) => PatientsTableLoaded(rows: rows),
        error: (message) =>
            PatientsTableError(message: message, onRetry: cubit.load),
        orElse: () => const PatientsTableSkeleton(),
      ),
    );
  }
}
