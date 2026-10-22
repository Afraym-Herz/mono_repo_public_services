import 'package:drift/drift.dart';
import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/helpers/patient_age.dart';

/// Resolves a demo fixture patient to a register id, inserting the minimal row
/// when the full register seeder has not run yet. Returns null for soft-deleted
/// files so a demo seed never resurrects a removed patient.
class DemoPatientLookup {
  DemoPatientLookup._();

  static Future<int?> ensure(
    PatientDao patientDao,
    QueueDemoPatient patient,
  ) async {
    final fileNumber = patient.fileNumber ?? 'DEMO-${patient.number}';
    final existing = await patientDao.getPatientByFileNumber(fileNumber);
    if (existing?.deletedAt != null) return null;
    return existing?.id ??
        patientDao.insertPatient(
          PatientsCompanion.insert(
            fileNumber: fileNumber,
            fullName: patient.name,
            searchText: patient.name,
            gender: patient.gender ?? AppConstants.genderMale,
            phone: Value(patient.phone),
            age: Value(PatientAge.fromIsoDate(patient.birthDate)),
          ),
        );
  }
}
