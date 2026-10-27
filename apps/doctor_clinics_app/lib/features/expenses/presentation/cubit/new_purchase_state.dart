part of 'new_purchase_cubit.dart';

@freezed
class NewPurchaseState with _$NewPurchaseState {
  const factory NewPurchaseState.initial() = _Initial;
  const factory NewPurchaseState.saving() = _Saving;
  const factory NewPurchaseState.saved({required Purchase purchase}) = _Saved;
  const factory NewPurchaseState.error({required String message}) = _Error;
}
