part of 'billing_toolbar_cubit.dart';

@freezed
class BillingToolbarState with _$BillingToolbarState {
  const factory BillingToolbarState({
    @Default(BillingRange.month) BillingRange range,
    @Default(BillingTab.summary) BillingTab tab,
    @Default('') String query,
    @Default(false) bool isSearching,
  }) = _BillingToolbarState;
}
