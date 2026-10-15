import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/consultations_table.dart';

part 'consultation_dao.g.dart';

@DriftAccessor(tables: [Consultations, VitalSigns])
class ConsultationDao extends DatabaseAccessor<AppDatabase> with _$ConsultationDaoMixin {
  ConsultationDao(super.db);

  Future<List<Consultation>> getConsultationsForPatient(int patientId) =>
      (select(consultations)..where((c) => c.patientId.equals(patientId))).get();
  Future<int> insertConsultation(ConsultationsCompanion entry) => into(consultations).insert(entry);
  Future<bool> updateConsultation(ConsultationsCompanion entry) => update(consultations).replace(entry);

  Future<VitalSign?> getVitalSigns(int consultationId) =>
      (select(vitalSigns)..where((v) => v.consultationId.equals(consultationId))).getSingleOrNull();
  Future<int> insertVitalSigns(VitalSignsCompanion entry) => into(vitalSigns).insert(entry);
}
