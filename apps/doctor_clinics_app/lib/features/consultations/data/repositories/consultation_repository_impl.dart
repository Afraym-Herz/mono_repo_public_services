import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';

class ConsultationRepositoryImpl implements IConsultationRepository {
  final IConsultationDatasource datasource;

  ConsultationRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Consultation>> getByPatient(int patientId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<Consultation?> getById(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.getById failed: $e'));
    }
  }

  @override
  FutureResult<Consultation> create(Consultation consultation) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.create failed: $e'));
    }
  }

  @override
  FutureResult<void> update(Consultation consultation) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.update failed: $e'));
    }
  }

  @override
  FutureResult<void> finalize(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.finalize failed: $e'));
    }
  }

  @override
  FutureResult<void> softDelete(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.softDelete failed: $e'));
    }
  }

  @override
  FutureResult<VitalSigns?> getVitals(int consultationId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.getVitals failed: $e'));
    }
  }

  @override
  FutureResult<void> saveVitals(VitalSigns vitals) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('consultations.saveVitals failed: $e'));
    }
  }
}
