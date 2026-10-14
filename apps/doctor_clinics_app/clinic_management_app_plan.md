# Clinic Management App (Flutter Desktop): Full Plan
**Local-only, offline-first, Arabic and English (RTL), single clinic, 1 to 3 users.**

---

## 1. Locked Decisions

| Topic | Decision |
| :--- | :--- |
| **Platform** | Flutter desktop, Windows first |
| **Storage** | Local SQLite via drift, no encryption. No cloud, no remote booking |
| **Languages** | English and Arabic with full RTL. UI language is per user |
| **Numerals** | Display western digits. Database always stores Western digits |
| **Dates** | Gregorian only |
| **Currency** | ج.م. Money stored as integer piasters |
| **Free text** | Arabic or English, no restriction |
| **Medicines** | One name plus optional alias |
| **Print language** | Set by the clinic template, one language and direction per clinic |
| **Booking** | Internal only: secretary or doctor books inside the app (phone calls, walk-ins) |

---

## 2. Tech Stack

* **UI:** Flutter desktop
* **Database:** drift over SQLite, migrations from day one, no encryption
* **State:** Bloc/Cubit
* **Navigation:** `go_router`
* **Localization:** `flutter_localizations`, `intl`, `gen-l10n` with `en.json` and `ar.json`
* **PDF and Print:** `pdf` and `printing`, with a bundled Arabic font (if language is `ar`) and the reverse in `en`
* **Excel:** `excel` package
* **Backup:** `archive` (zip), `path_provider`; backups are plain zip files
* **Passwords:** Salted bcrypt hash, nothing more
* **Fonts:** Cairo, Tajawal, or Noto Sans Arabic, bundled as assets so it works offline
* **Installer:** Inno Setup or MSIX
* **Testing:** `flutter_test`, in-memory drift databases for repository tests, golden tests for RTL layouts

---

## 3. Architecture

* **Feature-first structure**, each feature split into `data`, `domain`, `presentation`.

```text
lib/
  core/
    database/        # drift tables, DAOs, migrations
    l10n/            # ARB files, locale controller
    formatters/      # digits, money, dates
    normalization/   # Arabic text and digit normalizer
    printing/        # PDF base template, fonts, paper sizes
    security/        # hashing, session, permissions
    backup/          # backup service, restore service, scheduler
    widgets/         # shared RTL-safe widgets, LtrText, dialogs
    theme/
  features/
    auth/
    settings/        # clinic template, user settings
    patients/
    queue/           # appointments and waiting queue
    consultations/
    prescriptions/   # medicines and prescriptions
    operations/
    billing/
    reports/
    audit/
```

### Global Rules (Every feature must follow)
1. No hardcoded strings. All text goes through `AppLocalizations`.
2. Use `tr()` package, and `start`/`end`, never `left`/`right`.
3. The database stores language-neutral values: status codes (`waiting`, `done`), audit action keys, and Western digits. Translation happens only at display time.
4. The data layer returns error codes, not translated strings.
5. All numbers shown on screen or in PDFs go through one shared formatter. No widget formats numbers itself.
6. Every medical record uses soft delete (`deleted_at`) and has `created_at`, `updated_at`, `created_by`.
7. Every schema change is a migration. Never edit a released schema in place.
8. Money is integer piasters. Dates are stored as UTC ISO strings or integer timestamps, with local "business day" computed for queue and daily reports.

---

## 4. Shared Foundation Services

### 4.1 Digit and Text Normalization
* **Input normalization:** Convert Arabic-Indic (`٠١٢٣٤٥٦٧٨٩`) and Persian digits to Western before saving or searching. Applies to phone, file number, money, and search boxes.
* **Arabic search normalization:** Unify أ/إ/آ/ا, ى/ي, ة/ه, strip tashkeel and tatweel, lowercase Latin letters. Store a `search_text` column on patients and medicines, rebuilt on every save.
* **Search:** Match normalized query against `search_text` (patients: name, phone, file number; medicines: name and alias).

### 4.2 Display Formatters
* `formatNumber`, `formatMoney` (Arabic separators ٬ and ٫, suffix `ج.م` in one helper), `formatDate`, `formatTime`, `formatPhone` (always LTR).
* Digit style controlled by one settings value, so switching is a single change.

### 4.3 Clinic Template (Settings Record)
* Clinic name, doctor name, specialty, qualifications (Arabic, optional English)
* Phones, address, working hours
* Logo, header text, footer text
* Print language (Arabic or English)
* Paper size (A4 or A5), margins, font size
* Optional: bottom notes line
* Default consultation fee, working days and slot length (used by booking)

### 4.4 PDF Base
* One shared PDF builder: embeds fonts, sets text direction from the template language, renders header and footer from the clinic template, supports A4 and A5. Prescriptions, receipts, and reports all extend it.

### 4.5 Smoke Test (Do this in Phase 1)
* Print an A4 and A5 PDF containing an Arabic sentence with an English drug name, and `ج.م.`. Confirm shaping, bidi order, and digit glyphs. This removes the biggest technical risk early.

---

## 5. Feature Classification

### Important (MVP)
* Patient Management
* Appointments and Waiting Queue
* Consultations and Medical Records
* Prescriptions and Medicine Database
* Billing (basic)
* Security core (login, backup, restore)
* Localization, clinic template, shared formatters (foundation)

### Medium
* Operations Management
* Billing (advanced): expenses, discounts, refunds
* Reports and Exports (PDF and Excel)
* Two simple roles: doctor and secretary

### Later
* Lab results and file attachments (X-rays, PDFs)
* Dashboard charts
* Optional LAN sync between two PCs (doctor's PC as host)
* Appointment reminders printed or exported

---

## 6. Feature Specifications

### Feature 1: Patient Management
* **User stories:**
  * Secretary creates a new patient in under 30 seconds.
  * Secretary finds a returning patient by name, phone, or file number, typed in Arabic or English, with either digit style.
  * Doctor opens a profile showing history, allergies, chronic conditions, and previous visits.
* **Tables:**
  * `patients`: id, file_number (unique, auto sequence), full_name, search_text, gender, birth_date, phone, phone2, address, occupation, notes, blood_type, created_at, updated_at, deleted_at
  * `patient_allergies`: id, patient_id, name, severity, notes
  * `patient_conditions`: id, patient_id, name, since_date, notes (chronic conditions and past history)
* **Screens:** Patient list with live search and filters; Patient form (create and edit); Patient profile with tabs: Overview, Medical history, Visits, Prescriptions, Operations, Payments.
* **Edge cases and validation:** Duplicate phone warning; name required, phone optional; age calculation; soft delete only; allergy warning banner.

### Feature 2: Appointments and Waiting Queue
* **User stories:**
  * Secretary books an appointment (patient, date, time slot) and can reschedule or cancel.
  * Secretary adds a walk-in directly to today's queue.
  * Secretary can reorder, and urgent cases can be moved ahead.
* **Tables:**
  * `appointments`: id, patient_id, scheduled_date, scheduled_time, type (booked, walk_in, follow_up), status, reason, notes, cancelled_reason, created_by
  * `queue_entries`: id, appointment_id, queue_date, queue_number, position, status, arrived_at, called_at, finished_at, is_urgent
  * Statuses (codes): `booked`, `arrived`, `waiting`, `in_consultation`, `done`, `cancelled`, `no_show`
* **Rules:** Queue number resets each day (at 5 AM, not midnight); `position` is separate from `queue_number`; only one patient `in_consultation` at a time; booking checks slot capacity.

### Feature 3: Consultations and Medical Records
* **User stories:**
  * Doctor opens a consultation straight from the queue.
  * Doctor records complaint, vital signs, diagnosis, examination notes, treatment plan, and follow-up date.
  * Doctor reviews previous visits while writing a new one.
* **Tables:**
  * `consultations`: id, patient_id, queue_entry_id, visit_date, chief_complaint, history_of_present_illness, examination_notes, diagnosis, treatment_plan, follow_up_date, follow_up_notes, status (draft, finalized), created_by, finalized_at
  * `vital_signs`: id, consultation_id, weight_kg, height_cm, bp_systolic, bp_diastolic, pulse, temperature_c, spo2, blood_sugar, notes

### Feature 4: Prescriptions and Medicine Database
* **User stories:**
  * Doctor builds a prescription quickly from a reusable medicine list.
  * Doctor reuses a previous prescription or a saved template.
  * Prescription prints on the clinic template.
* **Tables:** `medicines`, `dosage_presets`, `frequency_presets`, `duration_presets`, `instruction_presets`, `prescriptions`, `prescription_items`, `prescription_templates`.
* **Rules:** Snapshot the medicine name on each item; allergy checks; bilingual preset labels.

### Feature 5: Operations Management (Medium)
* **Tables:** `operations`, `operation_required_tests`.
* **Rules:** Deposit creates a payment record; upcoming operations list with in-app reminder banner; checklist of required tests.

### Feature 6: Billing and Accounting
* **Tables:** `invoices`, `invoice_items`, `payments`, `expenses` (Medium), `expense_categories` (Medium).
* **Rules:** Debt tied to invoices; partial payments row support; sequential receipts with no gaps; no edits/deletions on payments (reversing entries only); all amounts integer piasters.

### Feature 7: Reports and Exports (Medium)
* Patient statistics, visit history by range, revenue reports, debts/outstanding balances, expenses/net results. Formats: PDF and Excel.

### Feature 8: Local Security and Backup
* Simple login with `users` table, first-run wizard, manual/automatic backups to a second location (keeping last 14), restore feature, stale backup warning. Two roles: doctor and secretary.

---

## 7. Cross-Feature Data Flow
1. Patient created or found
2. Appointment booked or walk-in added
3. Patient arrives, receives a queue number
4. Doctor opens consultation, finalizes it
5. Prescription created and printed
6. Invoice created, payment recorded (full or partial), receipt printed
7. Follow-up booking suggested
8. Daily summary and automatic backup at end of day

---

## 8. Build Phases

| Phase | Scope | Done when |
| :--- | :--- | :--- |
| **1. Foundation** | Project, drift schema/migrations, l10n and RTL theme, bundled font, formatters, normalizers, clinic template, login, navigation shell, basic backup/restore, PDF smoke test | App runs in both languages, PDF test passes, backup restores |
| **2. Patients** | Patient CRUD, normalized search, profile, allergies, conditions | Search works with Arabic variants and both digit styles |
| **3. Queue** | Appointments, queue numbering, status machine, live queue, calendar | A full day of bookings and walk-ins runs correctly |
| **4. Consultations** | Form, vitals, drafts, finalize, history | Visit flows from the queue to a saved record |
| **5. Prescriptions** | Medicines, presets, builder, PDF, history | A4 and A5 prescriptions print correctly in the template language |
| **6. Billing** | Invoices, payments, partial payments, debts, receipts, daily summary | Daily cash totals match payments exactly |
| **7. Medium features** | Operations, expenses, reports, Excel, simple roles | Each feature passes its spec checklist |
| **8. Polish** | Full bilingual QA, performance on large data, installer, restore drills, user manual | Clinic can install and run without help |

---

## 9. Testing Strategy
* **Unit:** normalizers, formatters, queue numbering, status machine, money math.
* **Repository:** in-memory drift, migration tests from older schema versions.
* **Widget and golden:** key screens in both LTR and RTL.
* **PDF:** visual checks of prescription and receipt in both languages and paper sizes.
* **Backup:** automated restore test, corrupted-file handling.
* **Performance:** seed 20,000 patients and 100,000 visits, test search/list/report speed.
* **Manual QA:** run a full simulated clinic day in Arabic and English.

---

## 10. Packaging and Release
* Installer with Inno Setup or MSIX (database stored in user's app data folder).
* App version and database schema version shown in Settings.
* Updates run migrations automatically after taking a backup first.
* Provide a short user guide in Arabic and English.

---

## 11. Risks and Mitigations

| Risk | Mitigation |
| :--- | :--- |
| Arabic PDF shaping or bidi bugs | Smoke test in Phase 1, shared PDF base |
| Data loss | Daily backup to second location, restore drills, stale-backup warning |
| Schema changes breaking old data | Migrations from day one, backup before migrating |
| Hard-to-search Arabic names | Normalized `search_text` column, tested with variant spellings |
| Midnight or clock changes affecting queue | Business-day calculation, rollover handling |
| Medical record edits without trace | Finalize and lock, amendment trail |
| Scope creep | Keep Medium and Later features out of the MVP |

---

## 12. Prompt Templates for Your AI Agent
* **Per-feature template context:** Flutter desktop, drift/SQLite, fully offline, single clinic, 1 to 3 users, English and Arabic (RTL), Western digits stored, Gregorian dates, money in integer piasters shown as `ج.م`, print language from clinic template.
* **Suggested order of agent sessions:** Foundation ➔ Clinic template/settings ➔ PDF base & smoke test ➔ Backup & restore ➔ Patients ➔ Appointments & queue ➔ Consultations ➔ Prescriptions & medicines ➔ Billing ➔ Operations ➔ Reports & exports ➔ Simple roles ➔ Polish, installer, & QA.

---

## 13. Decisions Still Open

| Decision | Suggested Default |
| :--- | :--- |
| Paper for receipts | A5 first, thermal printer later |
| Single consultation at a time | Yes, configurable |
| Database encryption | No. Rely on Windows login and BitLocker |
| Backup encryption | No. Keep backups in a trusted place |
| Roles in the MVP | Doctor and secretary, kept simple |

---

## 14. First Action
Start with **Phase 1 (Foundation)**, ending with the PDF smoke test. Then move to the **Patients** specification, since Arabic search normalization shows up there first.