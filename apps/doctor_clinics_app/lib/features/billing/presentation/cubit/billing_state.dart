part of 'billing_cubit.dart';

@freezed
class BillingState with _$BillingState {
  const factory BillingState.initial() = _Initial;
  const factory BillingState.loading() = _Loading;
  const factory BillingState.loaded({required BillingOverview overview}) =
      _Loaded;
  const factory BillingState.error({required String message}) = _Error;
}
