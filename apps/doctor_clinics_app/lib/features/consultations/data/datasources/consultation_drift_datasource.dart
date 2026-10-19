import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_mapper.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart'
    as entity;
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart'
    as entity;

/// Concrete Drift implementation of [IConsultationDatasource].
class ConsultationDriftDatasource implements IConsultationDatasource {
  final ConsultationDao dao;

  ConsultationDriftDatasource(this.dao);

  @override
  Future<List<entity.Consultation>> fetchByPatient(int patientId) async {
    final rows = await dao.getConsultationsForPatient(patientId);
    return rows.map(ConsultationMapper.toDomainConsultation).toList();
  }

  @override
  Future<entity.Consultation?> fetchById(int id) async {
    final row = await dao.getConsultationById(id);
    return row == null ? null : ConsultationMapper.toDomainConsultation(row);
  }

  @override
  Future<int> insert(entity.Consultation consultation) async {
    return dao.insertConsultation(
      ConsultationMapper.toConsultationCompanion(consultation),
    );
  }

  @override
  Future<void> update(entity.Consultation consultation) async {
    await dao.updateConsultation(
      ConsultationMapper.toConsultationCompanion(consultation),
    );
  }

  @override
  Future<void> softDelete(int id) async {
    await dao.deleteConsultation(id);
  }

  @override
  Future<entity.VitalSigns?> fetchVitals(int consultationId) async {
    final row = await dao.getVitalSigns(consultationId);
    return row == null ? null : ConsultationMapper.toDomainVitalSigns(row);
  }

  @override
  Future<void> upsertVitals(entity.VitalSigns vitals) async {
    await dao.upsertVitalSigns(ConsultationMapper.toVitalsCompanion(vitals));
  }
}
