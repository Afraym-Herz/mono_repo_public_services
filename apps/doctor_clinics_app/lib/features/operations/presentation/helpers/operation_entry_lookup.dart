import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';

/// Board row for [operationId].
///
/// Returns `null` both while the board is still loading and when the record is
/// gone, so callers can tell the two apart from the state itself.
OperationEntry? findOperationEntry(OperationBoardState state, int operationId) {
  final loaded = state.maybeMap(loaded: (value) => value, orElse: () => null);
  if (loaded == null) return null;
  for (final entry in loaded.entries) {
    if (entry.operation.id == operationId) return entry;
  }
  return null;
}
