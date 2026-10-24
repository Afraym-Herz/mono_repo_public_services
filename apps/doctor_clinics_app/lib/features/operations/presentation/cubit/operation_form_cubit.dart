import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';

part 'operation_form_state.dart';
part 'operation_form_cubit.freezed.dart';

/// Creates one operation together with its required-test checklist.
class OperationFormCubit extends Cubit<OperationFormState> {
  OperationFormCubit({required this.repository})
    : super(const OperationFormState.initial());

  final IOperationRepository repository;

  Future<void> save({
    required Operation operation,
    required List<String> testNames,
  }) async {
    if (state.maybeMap(saving: (_) => true, orElse: () => false)) return;
    emit(const OperationFormState.saving());

    final result = await repository.createWithTests(operation, testNames);
    if (isClosed) return;
    result.fold(
      (failure) => emit(OperationFormState.error(message: failure.message)),
      (created) => emit(OperationFormState.saved(operation: created)),
    );
  }
}
