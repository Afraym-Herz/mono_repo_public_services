import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';
import 'appointment_calendar.dart';

/// Form state for the booking dialog. Notifiers keep the form rebuild-free.
class AppointmentBookingController {
  AppointmentBookingController({
    required DateTime initialDate,
    required this.isWalkIn,
    Patient? initialPatient,
  }) {
    final today = AppointmentCalendar.dayOf(DateTime.now());
    final normalized = AppointmentCalendar.dayOf(initialDate);
    date = ValueNotifier(normalized.isBefore(today) ? today : normalized);
    selected = ValueNotifier(initialPatient);
    if (initialPatient != null) search.text = initialPatient.fullName;
  }

  final bool isWalkIn;
  final TextEditingController search = TextEditingController();
  final TextEditingController reason = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController deposit = TextEditingController();

  /// Patient picked up front when the sheet is opened from a suggestion.
  late final ValueNotifier<Patient?> selected;
  final ValueNotifier<String> type = ValueNotifier(
    AppConstants.appointmentTypeBooked,
  );
  final ValueNotifier<int> patientsRevision = ValueNotifier(0);
  late final ValueNotifier<DateTime> date;
  late Future<List<Patient>> _patients = _loadPatients();
  late final Future<ClinicTemplate?> template = _loadTemplate();

  /// Last loaded list, kept so a newly created patient can appear instantly.
  List<Patient>? lastPatients;

  Future<List<Patient>> get patients => _patients;

  /// Appends a patient created from the booking flow and selects it.
  void addPatient(Patient patient) {
    final updated = [
      patient,
      ...?lastPatients?.where((item) => item.id != patient.id),
    ];
    lastPatients = updated;
    _patients = Future.value(updated);
    selectPatient(patient);
    patientsRevision.value++;
  }

  /// Marks [patient] as the booking's patient and writes their name into the
  /// search field; the picker keeps its dropdown in sync with that text.
  void selectPatient(Patient patient) {
    selected.value = patient;
    search.text = patient.fullName;
    search.selection = TextSelection.collapsed(offset: search.text.length);
  }

  Future<List<Patient>> _loadPatients() {
    return getIt<PatientRepository>().getAllPatients().then((result) {
      final patients = result.fold((_) => <Patient>[], (list) => list);
      lastPatients = patients;
      return patients;
    });
  }

  Future<ClinicTemplate?> _loadTemplate() => getIt<ISettingsRepository>()
      .getClinicTemplate()
      .then((result) => result.fold((_) => null, (template) => template));

  void dispose() {
    search.dispose();
    reason.dispose();
    notes.dispose();
    deposit.dispose();
    selected.dispose();
    type.dispose();
    patientsRevision.dispose();
    date.dispose();
  }
}
