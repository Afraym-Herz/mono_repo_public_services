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
    // TODO: implement.
  }

  Future<void> loadDetail(int consultationId) async {
    // TODO: implement.
  }

  Future<void> create(Consultation consultation) async {
    // TODO: implement.
  }

  Future<void> update(Consultation consultation) async {
    // TODO: implement.
  }

  Future<void> finalizeConsultation(int id) async {
    // TODO: implement.
  }

  Future<void> saveVitals(VitalSigns vitals) async {
    // TODO: implement.
  }
}