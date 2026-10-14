import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';

class PatientRepositoryImpl implements PatientRepository {
  final IPatientDatasource datasource;

  PatientRepositoryImpl({required this.datasource});

  @override
  Future<void> addPatient(Patient patient) async {
    await datasource.insert(patient);
  }

  @override
  Future<void> deletePatient(int id) async {
    await datasource.softDelete(id);
  }

  @override
  Future<List<Patient>> getAllPatients() async {
    return await datasource.fetchAll();
  }

  @override
  Future<Patient?> getPatientById(int id) async {
    return await datasource.fetchById(id);
  }

  @override
  Future<void> updatePatient(Patient patient) async {
    await datasource.update(patient);
  }
}
