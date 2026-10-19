import 'package:core/core.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/prescription_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/settings_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/user_dao.dart';

import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_drift_datasource.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_local_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_drift_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_drift_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_drift_datasource.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_drift_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_drift_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_drift_datasource.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_drift_datasource.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_drift_datasource.dart';

/// Registers every feature datasource on top of the DAOs.
void registerAppDatasources() {
  getIt.registerLazySingleton<IPatientDatasource>(
    () => PatientDriftDatasource(getIt<PatientDao>()),
  );
  getIt.registerLazySingleton<IQueueDatasource>(
    () => QueueDriftDatasource(getIt<QueueDao>()),
  );
  getIt.registerLazySingleton<IConsultationDatasource>(
    () => ConsultationDriftDatasource(getIt<ConsultationDao>()),
  );
  getIt.registerLazySingleton<IPrescriptionDatasource>(
    () => PrescriptionDriftDatasource(getIt<PrescriptionDao>()),
  );
  getIt.registerLazySingleton<IOperationDatasource>(
    () => OperationDriftDatasource(getIt<OperationDao>()),
  );
  getIt.registerLazySingleton<IBillingDatasource>(
    () => BillingDriftDatasource(getIt<BillingDao>()),
  );
  getIt.registerLazySingleton<ISettingsDatasource>(
    () => SettingsDriftDatasource(getIt<SettingsDao>()),
  );
  getIt.registerLazySingleton<IReportDatasource>(
    () => ReportDriftDatasource(getIt<BillingDao>(), getIt<PatientDao>()),
  );
  getIt.registerLazySingleton<IBackupDatasource>(
    () => BackupLocalDatasource(),
  );
  getIt.registerLazySingleton<IAuthDatasource>(
    () => AuthDriftDatasource(getIt<UserDao>()),
  );
}
