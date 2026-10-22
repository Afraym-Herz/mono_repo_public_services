import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_name_matches_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_form_outcome.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_duplicate_dialog.dart';

/// Second layer of the duplicate guard, run on save.
///
/// The dropdown only helps while the name is being typed; this check also
/// covers a name typed while the dropdown was dismissed, using the same
/// order-sensitive matcher.
///
/// Returns the existing patient when the secretary chose the record that is
/// already on file, the [draft] when they insisted on a new file, or null when
/// the form should stay open.
Future<PatientFormOutcome?> resolveDuplicatePatient(
  BuildContext context, {
  required Patient draft,
}) async {
  final matches = await context.read<PatientNameMatchesCubit>().duplicates(
    draft.fullName,
  );
  if (!context.mounted) return null;
  if (matches.isEmpty) return PatientFormOutcome(patient: draft, created: true);
  final choice = await showPatientDuplicateDialog(
    context,
    existing: matches.first,
  );
  if (!context.mounted || choice == null) return null;
  return switch (choice) {
    PatientDuplicateChoice.useExisting => PatientFormOutcome(
      patient: matches.first,
      created: false,
    ),
    PatientDuplicateChoice.createAnyway => PatientFormOutcome(
      patient: draft,
      created: true,
    ),
  };
}
