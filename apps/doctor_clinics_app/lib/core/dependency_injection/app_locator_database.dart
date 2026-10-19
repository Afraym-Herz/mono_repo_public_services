import 'package:core/core.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/audit_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/prescription_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/settings_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/user_dao.dart';

/// Registers the Drift database and every DAO it exposes.
void registerAppDatabase() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<PatientDao>(() => PatientDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<QueueDao>(() => QueueDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<ConsultationDao>(() => ConsultationDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<PrescriptionDao>(() => PrescriptionDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<OperationDao>(() => OperationDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<BillingDao>(() => BillingDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<UserDao>(() => UserDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<SettingsDao>(() => SettingsDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<AuditDao>(() => AuditDao(getIt<AppDatabase>()));
}
