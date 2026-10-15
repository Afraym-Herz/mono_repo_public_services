import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/consultations/domain/entities/consultation.dart';
import 'package:doctor_clinics_app/features/consultations/domain/entities/vital_signs.dart';
import 'package:doctor_clinics_app/features/consultations/domain/repositories/consultation_repository.dart';

part 'consultation_state.dart';
part 'consultation_cubit.freezed.dart';

class ConsultationCubit extends Cubit<ConsultationState> {
  final IConsultationRepository repository;

  ConsultationCubit({required this.repository})
      : super(const ConsultationState.initial());

  Future<void> loadByPatient(int patientId) async {
    emit(const ConsultationState.loading());
    final result = await repository.getByPatient(patientId);
    result.fold(
      (failure) => emit(ConsultationState.error(message: failure.message)),
      (consultations) =>
          emit(ConsultationState.loaded(consultations: consultations)),
    );
  }

  Future<void> loadDetail(int consultationId) async {
    emit(const ConsultationState.loading());
    final cResult = await repository.getById(consultationId);
    final vitalsResult = await repository.getVitals(consultationId);

    if (cResult.isLeft()) {
      emit(
        ConsultationState.error(
          message: cResult.fold((f) => f.message, (_) => ''),
        ),
      );
      return;
    }

    final consultation = cResult.fold((_) => null, (c) => c);
    if (consultation == null) {
      emit(const ConsultationState.error(message: 'Consultation not found'));
      return;
    }

    final vitals = vitalsResult.fold((_) => null, (v) => v);
    emit(
      ConsultationState.detail(
        consultation: consultation,
        vitals: vitals,
      ),
    );
  }

  Future<void> create(Consultation consultation) async {
    emit(const ConsultationState.loading());
    final result = await repository.create(consultation);
    result.fold(
      (failure) => emit(ConsultationState.error(message: failure.message)),
      (saved) => loadDetail(saved.id),
    );
  }

  Future<void> update(Consultation consultation) async {
    emit(const ConsultationState.loading());
    final result = await repository.update(consultation);
    result.fold(
      (failure) => emit(ConsultationState.error(message: failure.message)),
      (_) => loadDetail(consultation.id),
    );
  }

  Future<void> finalizeConsultation(int id) async {
    emit(const ConsultationState.loading());
    final result = await repository.finalize(id);
    result.fold(
      (failure) => emit(ConsultationState.error(message: failure.message)),
      (_) => loadDetail(id),
    );
  }

  Future<void> saveVitals(VitalSigns vitals) async {
    final result = await repository.saveVitals(vitals);
    result.fold(
      (failure) => emit(ConsultationState.error(message: failure.message)),
      (_) => loadDetail(vitals.consultationId),
    );
  }
}