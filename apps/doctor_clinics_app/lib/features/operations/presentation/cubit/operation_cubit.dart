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
    // TODO: implement.
  }

  Future<void> loadByPatient(int patientId) async {
    // TODO: implement.
  }

  Future<void> loadUpcoming() async {
    // TODO: implement.
  }

  Future<void> create(Operation operation) async {
    // TODO: implement.
  }

  Future<void> update(Operation operation) async {
    // TODO: implement.
  }

  Future<void> addRequiredTest(
    OperationRequiredTest test,
  ) async {
    // TODO: implement.
  }

  Future<void> markTestDone(int testId) async {
    // TODO: implement.
  }
}