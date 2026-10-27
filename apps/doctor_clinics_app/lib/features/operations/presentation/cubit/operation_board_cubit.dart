import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_loader.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_filter.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'operation_board_state.dart';
part 'operation_board_cubit.freezed.dart';
part 'operation_board_actions.dart';
part 'operation_board_navigation.dart';

/// Loads and filters the surgical-operations board.
///
/// The board is one read model (operations + patients + tests) kept in state;
/// status tabs and the week focus stay client-side so switching never
/// re-queries the database.
class OperationBoardCubit extends Cubit<OperationBoardState>
    with OperationBoardActions, OperationBoardNavigation {
  OperationBoardCubit({
    required this.operationRepository,
    required this.patientRepository,
  }) : super(const OperationBoardState.initial());

  @override
  final IOperationRepository operationRepository;

  final PatientRepository patientRepository;

  /// Reloads the board, keeping the active tab and day focus.
  ///
  /// The modal routes own their own board cubit, so every `emit` after an
  /// await is guarded against a dispose that happened mid-load.
  @override
  Future<void> load() async {
    final current = state.maybeMap(
      loaded: (loaded) => loaded,
      orElse: () => null,
    );
    if (current == null) emit(const OperationBoardState.loading());

    final result = await OperationBoardLoader.load(
      operations: operationRepository,
      patients: patientRepository,
    );
    if (isClosed) return;
    if (!result.isSuccess) {
      emit(OperationBoardState.error(message: result.error ?? ''));
      return;
    }

    emit(
      OperationBoardState.loaded(
        entries: result.entries,
        filter: current?.filter ?? OperationFilter.all,
        focusedDay: current?.focusedDay,
      ),
    );
  }
}
