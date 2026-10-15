import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'patient_state.dart';
part 'patient_cubit.freezed.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepository repository;

  PatientCubit({required this.repository})
      : super(const PatientState.initial());

  Future<void> loadPatients() async {
    emit(const PatientState.loading());
    final result = await repository.getAllPatients();
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (patients) => emit(PatientState.loaded(patients: patients)),
    );
  }

  Future<void> searchPatients(String query) async {
    if (query.trim().isEmpty) {
      await loadPatients();
      return;
    }
    emit(const PatientState.loading());
    final result = await repository.searchPatients(query);
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (patients) => emit(PatientState.loaded(patients: patients)),
    );
  }

  Future<void> loadPatientDetail(int patientId) async {
    emit(const PatientState.loading());
    final patientResult = await repository.getPatientById(patientId);
    if (patientResult.isLeft()) {
      emit(
        PatientState.error(
          message: patientResult.fold((f) => f.message, (_) => ''),
        ),
      );
      return;
    }

    final patient = patientResult.fold((_) => null, (p) => p);
    if (patient == null) {
      emit(const PatientState.error(message: 'Patient not found'));
      return;
    }

    final allergiesResult = await repository.getPatientAllergies(patientId);
    final conditionsResult = await repository.getPatientConditions(patientId);

    final allergies = allergiesResult.fold((_) => <PatientAllergy>[], (a) => a);
    final conditions = conditionsResult.fold((_) => <PatientCondition>[], (c) => c);

    emit(
      PatientState.patientDetail(
        patient: patient,
        allergies: allergies,
        conditions: conditions,
      ),
    );
  }

  Future<void> addPatient(Patient patient) async {
    emit(const PatientState.loading());
    final result = await repository.addPatient(patient);
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (_) => loadPatients(),
    );
  }

  Future<void> updatePatient(Patient patient) async {
    emit(const PatientState.loading());
    final result = await repository.updatePatient(patient);
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (_) => loadPatientDetail(patient.id),
    );
  }

  Future<void> deletePatient(int id) async {
    emit(const PatientState.loading());
    final result = await repository.deletePatient(id);
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (_) => loadPatients(),
    );
  }

  Future<void> addAllergy(PatientAllergy allergy) async {
    final result = await repository.addAllergy(allergy);
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (_) => loadPatientDetail(allergy.patientId),
    );
  }

  Future<void> removeAllergy(int allergyId) async {
    await repository.removeAllergy(allergyId);
  }

  Future<void> addCondition(PatientCondition condition) async {
    final result = await repository.addCondition(condition);
    result.fold(
      (failure) => emit(PatientState.error(message: failure.message)),
      (_) => loadPatientDetail(condition.patientId),
    );
  }

  Future<void> removeCondition(int conditionId) async {
    await repository.removeCondition(conditionId);
  }
}