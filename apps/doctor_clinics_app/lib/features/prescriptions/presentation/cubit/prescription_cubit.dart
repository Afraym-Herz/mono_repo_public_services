import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/prescriptions/domain/entities/medicine.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/entities/prescription_item.dart';
import 'package:doctor_clinics_app/features/prescriptions/domain/repositories/prescription_repository.dart';

part 'prescription_state.dart';
part 'prescription_cubit.freezed.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  final IPrescriptionRepository repository;

  PrescriptionCubit({required this.repository})
      : super(const PrescriptionState.initial());

  Future<void> loadByPatient(int patientId) async {
    // TODO: implement.
  }

  Future<void> createPrescription(
    Prescription prescription,
  ) async {
    // TODO: implement.
  }

  Future<void> addItem(PrescriptionItem item) async {
    // TODO: implement.
  }

  Future<void> removeItem(int itemId) async {
    // TODO: implement.
  }

  Future<void> searchMedicines(String query) async {
    // TODO: implement.
  }
}