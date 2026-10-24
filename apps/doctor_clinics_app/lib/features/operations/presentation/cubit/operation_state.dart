part of 'operation_cubit.dart';

@freezed
class OperationState with _$OperationState {
  const factory OperationState.initial() = _Initial;
  const factory OperationState.loading() = _Loading;
  const factory OperationState.loaded({required List<Operation> operations}) =
      _Loaded;
  const factory OperationState.detail({
    required Operation operation,
    required List<OperationRequiredTest> requiredTests,
  }) = _Detail;
  const factory OperationState.error({required String message}) = _Error;
}
