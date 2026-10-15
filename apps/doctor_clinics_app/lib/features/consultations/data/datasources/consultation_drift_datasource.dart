import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';
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
    return rows.map(_toDomainConsultation).toList();
  }

  @override
  Future<entity.Consultation?> fetchById(int id) async {
    final row = await dao.getConsultationById(id);
    return row == null ? null : _toDomainConsultation(row);
  }

  @override
  Future<int> insert(entity.Consultation consultation) async {
    return dao.insertConsultation(_toConsultationCompanion(consultation));
  }

  @override
  Future<void> update(entity.Consultation consultation) async {
    await dao.updateConsultation(_toConsultationCompanion(consultation));
  }

  @override
  Future<void> softDelete(int id) async {
    await dao.deleteConsultation(id);
  }

  @override
  Future<entity.VitalSigns?> fetchVitals(int consultationId) async {
    final row = await dao.getVitalSigns(consultationId);
    return row == null ? null : _toDomainVitalSigns(row);
  }

  @override
  Future<void> upsertVitals(entity.VitalSigns vitals) async {
    await dao.upsertVitalSigns(
      VitalSignsCompanion(
        id: vitals.id > 0 ? Value(vitals.id) : const Value.absent(),
        consultationId: Value(vitals.consultationId),
        weightKg: Value(vitals.weightKg),
        heightCm: Value(vitals.heightCm),
        bpSystolic: Value(vitals.bpSystolic),
        bpDiastolic: Value(vitals.bpDiastolic),
        pulse: Value(vitals.pulse),
        temperatureC: Value(vitals.temperatureC),
        spo2: Value(vitals.spo2),
        bloodSugar: Value(vitals.bloodSugar?.toInt()),
        notes: Value(vitals.notes),
      ),
    );
  }

  entity.Consultation _toDomainConsultation(Consultation row) {
    return entity.Consultation(
      id: row.id,
      patientId: row.patientId,
      queueEntryId: row.queueEntryId,
      visitDate: row.visitDate,
      chiefComplaint: row.chiefComplaint,
      historyOfPresentIllness: row.historyOfPresentIllness,
      examinationNotes: row.examinationNotes,
      diagnosis: row.diagnosis,
      treatmentPlan: row.treatmentPlan,
      followUpDate: row.followUpDate,
      followUpNotes: row.followUpNotes,
      status: row.status,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      finalizedAt: row.finalizedAt,
      createdAt: row.visitDate,
      updatedAt: row.visitDate,
    );
  }

  ConsultationsCompanion _toConsultationCompanion(entity.Consultation c) {
    return ConsultationsCompanion(
      id: c.id > 0 ? Value(c.id) : const Value.absent(),
      patientId: Value(c.patientId),
      queueEntryId: Value(c.queueEntryId),
      visitDate: Value(c.visitDate),
      chiefComplaint: Value(c.chiefComplaint ?? ''),
      historyOfPresentIllness: Value(c.historyOfPresentIllness),
      examinationNotes: Value(c.examinationNotes),
      diagnosis: Value(c.diagnosis ?? ''),
      treatmentPlan: Value(c.treatmentPlan),
      followUpDate: Value(c.followUpDate),
      followUpNotes: Value(c.followUpNotes),
      status: Value(c.status),
      createdBy: Value(c.createdBy.toString()),
      finalizedAt: Value(c.finalizedAt),
    );
  }

  entity.VitalSigns _toDomainVitalSigns(VitalSign row) {
    return entity.VitalSigns(
      id: row.id,
      consultationId: row.consultationId,
      weightKg: row.weightKg,
      heightCm: row.heightCm,
      bpSystolic: row.bpSystolic,
      bpDiastolic: row.bpDiastolic,
      pulse: row.pulse,
      temperatureC: row.temperatureC,
      spo2: row.spo2,
      bloodSugar: row.bloodSugar?.toDouble(),
      notes: row.notes,
    );
  }
}
