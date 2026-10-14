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
    // TODO: implement.
  }

  Future<void> searchPatients(String query) async {
    // TODO: implement.
  }

  Future<void> loadPatientDetail(int patientId) async {
    // TODO: implement.
  }

  Future<void> addPatient(Patient patient) async {
    // TODO: implement.
  }

  Future<void> updatePatient(Patient patient) async {
    // TODO: implement.
  }

  Future<void> deletePatient(int id) async {
    // TODO: implement.
  }

  Future<void> addAllergy(PatientAllergy allergy) async {
    // TODO: implement.
  }

  Future<void> removeAllergy(int allergyId) async {
    // TODO: implement.
  }

  Future<void> addCondition(PatientCondition condition) async {
    // TODO: implement.
  }

  Future<void> removeCondition(int conditionId) async {
    // TODO: implement.
  }
}