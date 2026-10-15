import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';

part 'operation_state.dart';
part 'operation_cubit.freezed.dart';

class OperationCubit extends Cubit<OperationState> {
  final IOperationRepository repository;

  OperationCubit({required this.repository})
      : super(const OperationState.initial());

  Future<void> loadAll() async {
    emit(const OperationState.loading());
    final result = await repository.getAll();
    result.fold(
      (failure) => emit(OperationState.error(message: failure.message)),
      (operations) => emit(OperationState.loaded(operations: operations)),
    );
  }

  Future<void> loadByPatient(int patientId) async {
    emit(const OperationState.loading());
    final result = await repository.getByPatient(patientId);
    result.fold(
      (failure) => emit(OperationState.error(message: failure.message)),
      (operations) => emit(OperationState.loaded(operations: operations)),
    );
  }

  Future<void> loadUpcoming() async {
    emit(const OperationState.loading());
    final result = await repository.getUpcoming();
    result.fold(
      (failure) => emit(OperationState.error(message: failure.message)),
      (operations) => emit(OperationState.loaded(operations: operations)),
    );
  }

  Future<void> create(Operation operation) async {
    emit(const OperationState.loading());
    final result = await repository.create(operation);
    result.fold(
      (failure) => emit(OperationState.error(message: failure.message)),
      (_) => loadAll(),
    );
  }

  Future<void> update(Operation operation) async {
    emit(const OperationState.loading());
    final result = await repository.update(operation);
    result.fold(
      (failure) => emit(OperationState.error(message: failure.message)),
      (_) => loadAll(),
    );
  }

  Future<void> addRequiredTest(OperationRequiredTest test) async {
    final result = await repository.addRequiredTest(test);
    result.fold(
      (failure) => emit(OperationState.error(message: failure.message)),
      (_) => loadAll(),
    );
  }

  Future<void> markTestDone(int testId) async {
    final test = OperationRequiredTest(
      id: testId,
      operationId: 0,
      testName: '',
      isDone: true,
    );
    await repository.updateRequiredTest(test);
  }
}