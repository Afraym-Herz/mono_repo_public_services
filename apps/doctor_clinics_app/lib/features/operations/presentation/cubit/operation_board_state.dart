part of 'operation_board_cubit.dart';

@freezed
class OperationBoardState with _$OperationBoardState {
  const factory OperationBoardState.initial() = _Initial;
  const factory OperationBoardState.loading() = _Loading;
  const factory OperationBoardState.loaded({
    required List<OperationEntry> entries,
    required OperationFilter filter,
    DateTime? focusedDay,
    int? expandedId,
  }) = OperationBoardLoaded;
  const factory OperationBoardState.error({required String message}) = _Error;
}
