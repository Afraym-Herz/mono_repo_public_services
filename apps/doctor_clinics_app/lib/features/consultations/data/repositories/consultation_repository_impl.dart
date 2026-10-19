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
      final list = await datasource.fetchByPatient(patientId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('consultations.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<Consultation?> getById(int id) async {
    try {
      final consultation = await datasource.fetchById(id);
      return Right(consultation);
    } catch (e) {
      return Left(CacheFailure('consultations.getById failed: $e'));
    }
  }

  @override
  FutureResult<Consultation> create(Consultation consultation) async {
    try {
      final id = await datasource.insert(consultation);
      return Right(consultation.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('consultations.create failed: $e'));
    }
  }

  @override
  FutureResult<void> update(Consultation consultation) async {
    try {
      await datasource.update(consultation);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('consultations.update failed: $e'));
    }
  }

  @override
  FutureResult<void> finalize(int id) async {
    try {
      final existing = await datasource.fetchById(id);
      if (existing != null) {
        await datasource.update(
          existing.copyWith(
            status: AppConstants.consultationStatusFinalized,
            finalizedAt: DateTime.now(),
          ),
        );
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('consultations.finalize failed: $e'));
    }
  }

  @override
  FutureResult<void> softDelete(int id) async {
    try {
      await datasource.softDelete(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('consultations.softDelete failed: $e'));
    }
  }

  @override
  FutureResult<VitalSigns?> getVitals(int consultationId) async {
    try {
      final vitals = await datasource.fetchVitals(consultationId);
      return Right(vitals);
    } catch (e) {
      return Left(CacheFailure('consultations.getVitals failed: $e'));
    }
  }

  @override
  FutureResult<void> saveVitals(VitalSigns vitals) async {
    try {
      await datasource.upsertVitals(vitals);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('consultations.saveVitals failed: $e'));
    }
  }
}
