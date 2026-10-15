import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';

/// Drift-backed stub of [IConsultationDatasource].
class ConsultationDriftDatasource implements IConsultationDatasource {
  final ConsultationDao dao;
  ConsultationDriftDatasource(this.dao);

  @override
  Future<List<Consultation>> fetchByPatient(int patientId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<Consultation?> fetchById(int id) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Consultation consultation) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> update(Consultation consultation) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> softDelete(int id) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<VitalSigns?> fetchVitals(int consultationId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> upsertVitals(VitalSigns vitals) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
