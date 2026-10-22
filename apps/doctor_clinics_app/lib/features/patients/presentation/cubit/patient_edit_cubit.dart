import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'patient_edit_state.dart';
part 'patient_edit_cubit.freezed.dart';

/// Persists inline edits made in the patient profile card.
class PatientEditCubit extends Cubit<PatientEditState> {
  PatientEditCubit({required this.repository})
    : super(const PatientEditState.initial());

  final PatientRepository repository;

  Future<void> save(Patient patient) async {
    if (state.maybeMap(saving: (_) => true, orElse: () => false)) return;
    emit(const PatientEditState.saving());

    final result = await repository.updatePatient(patient);
    if (isClosed) return;
    result.fold(
      (failure) => emit(PatientEditState.error(message: failure.message)),
      (_) => emit(PatientEditState.saved(patient: patient)),
    );
  }

  /// Clears the last result so the next save always transitions.
  void reset() => emit(const PatientEditState.initial());
}
