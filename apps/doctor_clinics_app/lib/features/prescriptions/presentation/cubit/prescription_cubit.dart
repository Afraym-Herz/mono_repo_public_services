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
    emit(const PrescriptionState.loading());
    final result = await repository.getByPatient(patientId);
    result.fold(
      (failure) => emit(PrescriptionState.error(message: failure.message)),
      (prescriptions) =>
          emit(PrescriptionState.loaded(prescriptions: prescriptions)),
    );
  }

  Future<void> createPrescription(Prescription prescription) async {
    emit(const PrescriptionState.loading());
    final result = await repository.create(prescription);
    final medsResult = await repository.getAllMedicines();
    final medicines = medsResult.fold((_) => <Medicine>[], (m) => m);

    result.fold(
      (failure) => emit(PrescriptionState.error(message: failure.message)),
      (saved) => emit(
        PrescriptionState.builder(
          prescription: saved,
          items: const [],
          medicines: medicines,
        ),
      ),
    );
  }

  Future<void> addItem(PrescriptionItem item) async {
    final result = await repository.addItem(item);
    if (result.isLeft()) {
      emit(
        PrescriptionState.error(
          message: result.fold((f) => f.message, (_) => ''),
        ),
      );
      return;
    }
    final itemsResult = await repository.getItems(item.prescriptionId);
    final medsResult = await repository.getAllMedicines();
    final items = itemsResult.fold((_) => <PrescriptionItem>[], (i) => i);
    final medicines = medsResult.fold((_) => <Medicine>[], (m) => m);

    state.maybeWhen(
      builder: (prescription, _, _) => emit(
        PrescriptionState.builder(
          prescription: prescription,
          items: items,
          medicines: medicines,
        ),
      ),
      orElse: () {},
    );
  }

  Future<void> removeItem(int itemId) async {
    await repository.removeItem(itemId);
  }

  Future<void> searchMedicines(String query) async {
    final result = await repository.searchMedicines(query);
    result.fold(
      (failure) => emit(PrescriptionState.error(message: failure.message)),
      (medicines) {
        state.maybeWhen(
          builder: (prescription, items, _) => emit(
            PrescriptionState.builder(
              prescription: prescription,
              items: items,
              medicines: medicines,
            ),
          ),
          orElse: () {},
        );
      },
    );
  }
}