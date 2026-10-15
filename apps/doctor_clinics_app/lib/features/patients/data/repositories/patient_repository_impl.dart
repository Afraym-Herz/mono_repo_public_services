import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_allergy.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_condition.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';

class PatientRepositoryImpl implements PatientRepository {
  final IPatientDatasource datasource;

  PatientRepositoryImpl({required this.datasource});

  @override
  FutureResult<void> addPatient(Patient patient) async {
    try {
      await datasource.insert(patient);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.addPatient failed: $e'));
    }
  }

  @override
  FutureResult<void> deletePatient(int id) async {
    try {
      await datasource.softDelete(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.deletePatient failed: $e'));
    }
  }

  @override
  FutureResult<List<Patient>> getAllPatients() async {
    try {
      return Right(await datasource.fetchAll());
    } catch (e) {
      return Left(CacheFailure('patients.getAllPatients failed: $e'));
    }
  }

  @override
  FutureResult<Patient?> getPatientById(int id) async {
    try {
      return Right(await datasource.fetchById(id));
    } catch (e) {
      return Left(CacheFailure('patients.getPatientById failed: $e'));
    }
  }

  @override
  FutureResult<void> updatePatient(Patient patient) async {
    try {
      await datasource.update(patient);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.updatePatient failed: $e'));
    }
  }

  @override
  FutureResult<List<Patient>> searchPatients(String query) async {
    try {
      return Right(await datasource.search(query));
    } catch (e) {
      return Left(CacheFailure('patients.searchPatients failed: $e'));
    }
  }

  @override
  FutureResult<List<PatientAllergy>> getPatientAllergies(int patientId) async {
    try {
      return Right(await datasource.fetchAllergies(patientId));
    } catch (e) {
      return Left(CacheFailure('patients.getPatientAllergies failed: $e'));
    }
  }

  @override
  FutureResult<void> addAllergy(PatientAllergy allergy) async {
    try {
      await datasource.insertAllergy(allergy);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.addAllergy failed: $e'));
    }
  }

  @override
  FutureResult<void> removeAllergy(int allergyId) async {
    try {
      await datasource.deleteAllergy(allergyId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.removeAllergy failed: $e'));
    }
  }

  @override
  FutureResult<List<PatientCondition>> getPatientConditions(int patientId) async {
    try {
      return Right(await datasource.fetchConditions(patientId));
    } catch (e) {
      return Left(CacheFailure('patients.getPatientConditions failed: $e'));
    }
  }

  @override
  FutureResult<void> addCondition(PatientCondition condition) async {
    try {
      await datasource.insertCondition(condition);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.addCondition failed: $e'));
    }
  }

  @override
  FutureResult<void> removeCondition(int conditionId) async {
    try {
      await datasource.deleteCondition(conditionId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('patients.removeCondition failed: $e'));
    }
  }
}
