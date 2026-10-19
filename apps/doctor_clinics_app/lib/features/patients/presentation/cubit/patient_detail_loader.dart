import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_cubit.dart';

/// Resolves the [PatientState] for a single patient's detail view.
///
/// Keeps [PatientCubit] a thin emitter: the repository fan-out (profile +
/// allergies + conditions) and its fallbacks live here instead.
class PatientDetailLoader {
  PatientDetailLoader._();

  /// Loads the patient, allergy, and condition data for [patientId].
  static Future<PatientState> load(
    PatientRepository repository,
    int patientId,
  ) async {
    final patientResult = await repository.getPatientById(patientId);
    if (patientResult.isLeft()) {
      return PatientState.error(
        message: patientResult.fold((f) => f.message, (_) => ''),
      );
    }

    final patient = patientResult.fold((_) => null, (p) => p);
    if (patient == null) {
      return const PatientState.error(message: 'Patient not found');
    }

    final allergiesResult = await repository.getPatientAllergies(patientId);
    final conditionsResult = await repository.getPatientConditions(patientId);

    final allergies = allergiesResult.fold((_) => <PatientAllergy>[], (a) => a);
    final conditions = conditionsResult.fold(
      (_) => <PatientCondition>[],
      (c) => c,
    );

    return PatientState.patientDetail(
      patient: patient,
      allergies: allergies,
      conditions: conditions,
    );
  }
}
