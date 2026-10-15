import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
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
}
