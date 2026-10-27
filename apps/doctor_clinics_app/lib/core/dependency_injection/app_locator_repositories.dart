import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';
import 'package:doctor_clinics_app/features/backup/data/repositories/backup_repository_impl.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_impl.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/data/repositories/consultation_repository_impl.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_datasource.dart';
import 'package:doctor_clinics_app/features/expenses/data/repositories/expenses_repository_impl.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/repositories/operation_repository_impl.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';
import 'package:doctor_clinics_app/features/patients/data/repositories/patient_repository_impl.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/repositories/prescription_repository_impl.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/repositories/queue_repository_impl.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';
import 'package:doctor_clinics_app/features/reports/data/repositories/report_repository_impl.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';
import 'package:doctor_clinics_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';

/// Registers every feature repository on top of the datasources.
void registerAppRepositories() {
  getIt.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(datasource: getIt<IPatientDatasource>()),
  );
  getIt.registerLazySingleton<IQueueRepository>(
    () => QueueRepositoryImpl(datasource: getIt<IQueueDatasource>()),
  );
  getIt.registerLazySingleton<IConsultationRepository>(
    () => ConsultationRepositoryImpl(
      datasource: getIt<IConsultationDatasource>(),
    ),
  );
  getIt.registerLazySingleton<IPrescriptionRepository>(
    () => PrescriptionRepositoryImpl(
      datasource: getIt<IPrescriptionDatasource>(),
    ),
  );
  getIt.registerLazySingleton<IOperationRepository>(
    () => OperationRepositoryImpl(datasource: getIt<IOperationDatasource>()),
  );
  getIt.registerLazySingleton<IBillingRepository>(
    () => BillingRepositoryImpl(datasource: getIt<IBillingDatasource>()),
  );
  getIt.registerLazySingleton<IExpensesRepository>(
    () => ExpensesRepositoryImpl(datasource: getIt<IExpensesDatasource>()),
  );
  getIt.registerLazySingleton<ISettingsRepository>(
    () => SettingsRepositoryImpl(datasource: getIt<ISettingsDatasource>()),
  );
  getIt.registerLazySingleton<IReportRepository>(
    () => ReportRepositoryImpl(datasource: getIt<IReportDatasource>()),
  );
  getIt.registerLazySingleton<IBackupRepository>(
    () => BackupRepositoryImpl(datasource: getIt<IBackupDatasource>()),
  );
  // Core contract: HeaderLogoutButton resolves getIt<AuthRepository>().
  // AuthRepositoryImpl maps app User ↔ core AuthUser at the boundary.
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(datasource: getIt<IAuthDatasource>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => getIt<IAuthRepository>() as AuthRepository,
  );
}
