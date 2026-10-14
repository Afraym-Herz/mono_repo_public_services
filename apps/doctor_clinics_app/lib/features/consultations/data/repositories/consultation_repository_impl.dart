import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';

class ConsultationRepositoryImpl implements IConsultationRepository {
  final IConsultationDatasource datasource;

  ConsultationRepositoryImpl({required this.datasource});

  @override
  Future<List<Consultation>> getByPatient(int patientId) {
    throw UnimplementedError();
  }

  @override
  Future<Consultation?> getById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Consultation> create(Consultation consultation) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Consultation consultation) {
    throw UnimplementedError();
  }

  @override
  Future<void> finalize(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> softDelete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<VitalSigns?> getVitals(int consultationId) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveVitals(VitalSigns vitals) {
    throw UnimplementedError();
  }
}