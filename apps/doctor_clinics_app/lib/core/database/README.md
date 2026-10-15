# Clinic Management App – Local SQLite Database (Drift)

This folder contains the complete local SQLite database structure specified in `clinic_management_app_plan.md`.

## Tables (`lib/core/database/tables/`)

| File | Tables | Description |
|---|---|---|
| `patients_table.dart` | `Patients`, `PatientAllergies`, `PatientConditions` | Patient demographics, normalized `searchText`, allergies, chronic conditions |
| `appointments_table.dart` | `Appointments`, `QueueEntries` | Booking schedules and daily live waiting queue entries |
| `consultations_table.dart` | `Consultations`, `VitalSigns` | Medical encounter notes, diagnoses, vital signs |
| `prescriptions_table.dart` | `Medicines`, `MedicinePresets`, `Prescriptions`, `PrescriptionItems`, `PrescriptionTemplates` | Medicine formulary, bilingual presets, prescription builder items & templates |
| `operations_table.dart` | `Operations`, `OperationRequiredTests` | Surgical procedures, test checklists, deposits |
| `billing_table.dart` | `Invoices`, `InvoiceItems`, `Payments`, `ExpenseCategories`, `Expenses` | Accounting, integer piasters, immutable receipts, clinic expenses |
| `users_table.dart` | `Users` | App users with salted bcrypt password hashes, doctor/secretary roles |
| `clinic_settings_table.dart` | `ClinicSettingsTable` | Single clinic template, print language, paper size, slot length |
| `audit_logs_table.dart` | `AuditLogs` | Immutable audit trail for system actions |

## DAOs (`lib/core/database/daos/`)

- `PatientDao`: CRUD & search for patients, allergies, conditions
- `QueueDao`: CRUD for appointments, daily queue management
- `ConsultationDao`: Consultations, drafts, finalization, vitals
- `PrescriptionDao`: Formularies, prescription builder, templates
- `OperationDao`: Operations, test checklists
- `BillingDao`: Invoices, line items, payments, expenses
- `UserDao`: Authentication, user retrieval
- `SettingsDao`: Clinic settings management
- `AuditDao`: Logging audit events

## Connection & Migrations (`lib/core/database/`)

- `app_database.dart`: Primary `@DriftDatabase` registering all 22 tables and 9 DAOs. Includes `MigrationStrategy` for day-one migrations.
- `connection/connection.dart`: Native Windows desktop SQLite connection through `drift_flutter`.
