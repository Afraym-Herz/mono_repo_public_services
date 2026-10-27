part of 'expenses_cubit.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = _Initial;
  const factory ExpensesState.loading() = _Loading;
  const factory ExpensesState.loaded({required ExpensesOverview overview}) =
      _Loaded;
  const factory ExpensesState.error({required String message}) = _Error;
}
