part of 'operation_form_cubit.dart';

@freezed
class OperationFormState with _$OperationFormState {
  const factory OperationFormState.initial() = _Initial;
  const factory OperationFormState.saving() = _Saving;
  const factory OperationFormState.saved({required Operation operation}) =
      _Saved;
  const factory OperationFormState.error({required String message}) = _Error;
}
