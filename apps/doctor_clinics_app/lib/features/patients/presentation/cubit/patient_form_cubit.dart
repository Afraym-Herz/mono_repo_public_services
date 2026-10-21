import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/helpers/patient_file_number.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'patient_form_state.dart';
part 'patient_form_cubit.freezed.dart';

/// Creates one patient record and exposes the stored row back to the caller.
class PatientFormCubit extends Cubit<PatientFormState> {
  PatientFormCubit({required this.repository})
    : super(const PatientFormState.initial());

  final PatientRepository repository;

  Future<void> save(Patient patient) async {
    if (state.maybeMap(saving: (_) => true, orElse: () => false)) return;
    emit(const PatientFormState.saving());

    final highestResult = await repository.getMaxFileNumber();
    if (isClosed) return;
    PatientFormState? failure;
    final highest = highestResult.fold<int?>((error) {
      failure = PatientFormState.error(message: error.message);
      return null;
    }, (highest) => highest);
    if (failure != null) {
      emit(failure!);
      return;
    }

    final result = await repository.addPatient(
      patient.copyWith(
        fileNumber: PatientFileNumber.next(highest),
        searchText: _searchText(patient),
      ),
    );
    if (isClosed) return;
    result.fold(
      (error) => emit(PatientFormState.error(message: error.message)),
      (created) => emit(PatientFormState.saved(patient: created)),
    );
  }

  String _searchText(Patient patient) => [
    patient.fullName,
    patient.phone ?? '',
  ].where((value) => value.trim().isNotEmpty).join(' ').toLowerCase();
}
