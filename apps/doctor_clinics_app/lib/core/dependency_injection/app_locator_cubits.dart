import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';
import 'package:doctor_clinics_app/features/backup/presentation/cubit/backup_cubit.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expense_form_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/invoice_detail_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/new_expense_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/new_invoice_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/new_purchase_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/record_payment_cubit.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';
import 'package:doctor_clinics_app/features/consultations/presentation/cubit/consultation_cubit.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_form_cubit.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_edit_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_form_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_list_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_name_matches_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';
import 'package:doctor_clinics_app/features/prescriptions/presentation/cubit/prescription_cubit.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:doctor_clinics_app/features/reports/domain/repositories/report_repository.dart';
import 'package:doctor_clinics_app/features/reports/presentation/cubit/report_cubit.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:doctor_clinics_app/features/settings/presentation/cubit/settings_cubit.dart';

/// Registers every feature cubit as a factory on top of the repositories.
void registerAppCubits() {
  getIt.registerFactory<PatientCubit>(
    () => PatientCubit(repository: getIt<PatientRepository>()),
  );
  getIt.registerFactory<PatientEditCubit>(
    () => PatientEditCubit(repository: getIt<PatientRepository>()),
  );
  getIt.registerFactory<PatientFormCubit>(
    () => PatientFormCubit(repository: getIt<PatientRepository>()),
  );
  getIt.registerFactory<PatientListCubit>(
    () => PatientListCubit(
      patientRepository: getIt<PatientRepository>(),
      consultationRepository: getIt<IConsultationRepository>(),
      billingRepository: getIt<IBillingRepository>(),
    ),
  );
  getIt.registerFactory<PatientToolbarCubit>(() => PatientToolbarCubit());
  getIt.registerFactory<PatientNameMatchesCubit>(
    () => PatientNameMatchesCubit(repository: getIt<PatientRepository>()),
  );
  getIt.registerFactory<QueueCubit>(
    () => QueueCubit(
      repository: getIt<IQueueRepository>(),
      settingsRepository: getIt<ISettingsRepository>(),
    ),
  );
  getIt.registerFactory<AppointmentCubit>(
    () => AppointmentCubit(repository: getIt<IQueueRepository>()),
  );
  getIt.registerFactory<ConsultationCubit>(
    () => ConsultationCubit(repository: getIt<IConsultationRepository>()),
  );
  getIt.registerFactory<PrescriptionCubit>(
    () => PrescriptionCubit(repository: getIt<IPrescriptionRepository>()),
  );
  getIt.registerFactory<OperationCubit>(
    () => OperationCubit(repository: getIt<IOperationRepository>()),
  );
  getIt.registerFactory<OperationFormCubit>(
    () => OperationFormCubit(repository: getIt<IOperationRepository>()),
  );
  getIt.registerFactory<OperationBoardCubit>(
    () => OperationBoardCubit(
      operationRepository: getIt<IOperationRepository>(),
      patientRepository: getIt<PatientRepository>(),
    ),
  );
  getIt.registerFactory<BillingCubit>(
    () => BillingCubit(
      repository: getIt<IBillingRepository>(),
      patientRepository: getIt<PatientRepository>(),
    ),
  );
  getIt.registerFactory<BillingToolbarCubit>(() => BillingToolbarCubit());
  getIt.registerFactory<ExpensesCubit>(
    () => ExpensesCubit(repository: getIt<IExpensesRepository>()),
  );
  getIt.registerFactory<ExpensesToolbarCubit>(() => ExpensesToolbarCubit());
  getIt.registerFactory<NewInvoiceCubit>(
    () => NewInvoiceCubit(repository: getIt<IBillingRepository>()),
  );
  getIt.registerFactory<NewPurchaseCubit>(
    () => NewPurchaseCubit(repository: getIt<IExpensesRepository>()),
  );
  getIt.registerFactory<NewExpenseCubit>(
    () => NewExpenseCubit(repository: getIt<IExpensesRepository>()),
  );
  getIt.registerFactory<InvoiceDetailCubit>(
    () => InvoiceDetailCubit(
      repository: getIt<IBillingRepository>(),
      patientRepository: getIt<PatientRepository>(),
    ),
  );
  getIt.registerFactory<RecordPaymentCubit>(
    () => RecordPaymentCubit(
      repository: getIt<IBillingRepository>(),
      patientRepository: getIt<PatientRepository>(),
    ),
  );
  getIt.registerFactory<ExpenseFormCubit>(
    () => ExpenseFormCubit(repository: getIt<IExpensesRepository>()),
  );
  getIt.registerFactory<SettingsCubit>(
    () => SettingsCubit(repository: getIt<ISettingsRepository>()),
  );
  getIt.registerFactory<ReportCubit>(
    () => ReportCubit(repository: getIt<IReportRepository>()),
  );
  getIt.registerFactory<BackupCubit>(
    () => BackupCubit(repository: getIt<IBackupRepository>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(repository: getIt<IAuthRepository>()),
  );
}
