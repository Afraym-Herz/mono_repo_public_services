part of 'operation_board_cubit.dart';

/// Mutations available from the board cards.
///
/// Each method returns `null` on success or a readable failure message, so the
/// caller can show a snackbar without dropping the loaded board into an error
/// state.
mixin OperationBoardActions on Cubit<OperationBoardState> {
  IOperationRepository get operationRepository;

  Future<void> load();

  Future<String?> toggleTest(
    OperationEntry entry,
    OperationRequiredTest test,
  ) async {
    final updated = test.copyWith(isDone: !(test.isDone ?? false));
    final result = await operationRepository.updateRequiredTest(updated);
    return _finish(result);
  }

  Future<String?> complete(OperationEntry entry) =>
      _setStatus(entry, AppConstants.operationStatusCompleted);

  Future<String?> cancel(OperationEntry entry) =>
      _setStatus(entry, AppConstants.operationStatusCancelled);

  Future<String?> softDelete(OperationEntry entry) async {
    final result = await operationRepository.softDelete(entry.operation.id);
    return _finish(result);
  }

  Future<String?> _setStatus(OperationEntry entry, String status) async {
    final operation = entry.operation.copyWith(
      status: status,
      updatedAt: DateTime.now(),
    );
    final result = await operationRepository.update(operation);
    return _finish(result);
  }

  Future<String?> _finish(Either<Failure, void> result) async {
    final failure = result.fold<Failure?>((failure) => failure, (_) => null);
    if (failure != null) return failure.message;
    await load();
    return null;
  }
}
