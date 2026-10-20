import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'patient_list_state.dart';
part 'patient_list_cubit.freezed.dart';

/// Loads the patients register shown by the list screen.
///
/// The register is a read model: every patient is enriched with its newest
/// consultation (last visit), nearest follow-up and outstanding balance.
/// Filtering and search stay in the toolbar cubit so this one only loads.
class PatientListCubit extends Cubit<PatientListState> {
  PatientListCubit({
    required this.patientRepository,
    required this.consultationRepository,
    required this.billingRepository,
  }) : super(const PatientListState.initial());

  final PatientRepository patientRepository;
  final IConsultationRepository consultationRepository;
  final IBillingRepository billingRepository;

  Future<void> load() async {
    emit(const PatientListState.loading());

    final result = await patientRepository.getAllPatients();
    if (result.isLeft()) {
      result.fold(
        (failure) => emit(PatientListState.error(message: failure.message)),
        (_) {},
      );
      return;
    }

    final rows = <PatientListRow>[];
    for (final patient in result.getOrElse(() => const <Patient>[])) {
      final consultations = (await consultationRepository.getByPatient(
        patient.id,
      )).getOrElse(() => const []);
      final debt = (await billingRepository.getPatientDebt(
        patient.id,
      )).getOrElse(() => 0);

      rows.add(
        PatientListRow(
          patient: patient,
          lastVisit: _lastVisit(consultations),
          followUpDate: _nextFollowUp(consultations),
          debtPiasters: debt,
        ),
      );
    }

    emit(PatientListState.loaded(rows: rows));
  }

  /// Soft-deletes [row]'s patient and reloads the register.
  Future<void> delete(PatientListRow row) async {
    final result = await patientRepository.deletePatient(row.patient.id);
    result.fold(
      (failure) => emit(PatientListState.error(message: failure.message)),
      (_) => load(),
    );
  }

  DateTime? _lastVisit(List<Consultation> consultations) {
    DateTime? latest;
    for (final consultation in consultations) {
      if (latest == null || consultation.visitDate.isAfter(latest)) {
        latest = consultation.visitDate;
      }
    }
    return latest;
  }

  DateTime? _nextFollowUp(List<Consultation> consultations) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    DateTime? next;
    for (final consultation in consultations) {
      final date = consultation.followUpDate;
      if (date == null) continue;
      final day = DateTime(date.year, date.month, date.day);
      if (day.isBefore(today)) continue;
      if (next == null || day.isBefore(next)) next = day;
    }
    return next;
  }
}
