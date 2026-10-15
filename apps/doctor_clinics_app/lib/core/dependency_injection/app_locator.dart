import 'package:core/core.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/prescription_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/user_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/settings_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/audit_dao.dart';

import 'package:doctor_clinics_app/features/patients/data/datasources/patient_datasource.dart';
import 'package:doctor_clinics_app/features/patients/data/datasources/patient_drift_datasource.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/patients/data/repositories/patient_repository_impl.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_cubit.dart';

import 'package:doctor_clinics_app/features/queue/data/datasources/queue_datasource.dart';
import 'package:doctor_clinics_app/features/queue/data/datasources/queue_drift_datasource.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/data/repositories/queue_repository_impl.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';

import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/data/datasources/consultation_drift_datasource.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';
import 'package:doctor_clinics_app/features/consultations/data/repositories/consultation_repository_impl.dart';
import 'package:doctor_clinics_app/features/consultations/presentation/cubit/consultation_cubit.dart';

import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/datasources/prescription_drift_datasource.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';
import 'package:doctor_clinics_app/features/prescriptions/data/repositories/prescription_repository_impl.dart';
import 'package:doctor_clinics_app/features/prescriptions/presentation/cubit/prescription_cubit.dart';

import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_drift_datasource.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/operations/data/repositories/operation_repository_impl.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_cubit.dart';

import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_drift_datasource.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_impl.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_cubit.dart';

import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_drift_datasource.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:doctor_clinics_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:doctor_clinics_app/features/settings/presentation/cubit/settings_cubit.dart';

import 'package:doctor_clinics_app/features/reports/data/datasources/report_datasource.dart';
import 'package:doctor_clinics_app/features/reports/data/datasources/report_drift_datasource.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';
import 'package:doctor_clinics_app/features/reports/data/repositories/report_repository_impl.dart';
import 'package:doctor_clinics_app/features/reports/presentation/cubit/report_cubit.dart';

import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_local_datasource.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';
import 'package:doctor_clinics_app/features/backup/data/repositories/backup_repository_impl.dart';
import 'package:doctor_clinics_app/features/backup/presentation/cubit/backup_cubit.dart';

import 'package:doctor_clinics_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:doctor_clinics_app/features/auth/data/datasources/auth_drift_datasource.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctor_clinics_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';

/// Register app-specific dependencies: Drift database, DAOs, repositories, and cubits.
void setupAppLocator() {
  // ── Database & DAOs ──
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

  // ── Datasources ──
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

  // ── Repositories ──
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

  // ── Cubits ──
  getIt.registerFactory<PatientCubit>(() => PatientCubit(repository: getIt<PatientRepository>()));
  getIt.registerFactory<QueueCubit>(() => QueueCubit(repository: getIt<IQueueRepository>()));
  getIt.registerFactory<ConsultationCubit>(() => ConsultationCubit(repository: getIt<IConsultationRepository>()));
  getIt.registerFactory<PrescriptionCubit>(() => PrescriptionCubit(repository: getIt<IPrescriptionRepository>()));
  getIt.registerFactory<OperationCubit>(() => OperationCubit(repository: getIt<IOperationRepository>()));
  getIt.registerFactory<BillingCubit>(() => BillingCubit(repository: getIt<IBillingRepository>()));
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(repository: getIt<ISettingsRepository>()));
  getIt.registerFactory<ReportCubit>(() => ReportCubit(repository: getIt<IReportRepository>()));
  getIt.registerFactory<BackupCubit>(() => BackupCubit(repository: getIt<IBackupRepository>()));
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(repository: getIt<IAuthRepository>()),
  );
}
