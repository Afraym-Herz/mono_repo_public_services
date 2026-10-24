part of 'new_invoice_cubit.dart';

@freezed
class NewInvoiceState with _$NewInvoiceState {
  const factory NewInvoiceState.initial() = _Initial;
  const factory NewInvoiceState.saving() = _Saving;
  const factory NewInvoiceState.saved({required Invoice invoice}) = _Saved;
  const factory NewInvoiceState.error({required String message}) = _Error;
}
