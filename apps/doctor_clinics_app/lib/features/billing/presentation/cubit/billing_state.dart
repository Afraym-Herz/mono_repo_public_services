part of 'billing_cubit.dart';

@freezed
class BillingState with _$BillingState {
  const factory BillingState.initial() = _Initial;
  const factory BillingState.loading() = _Loading;
  const factory BillingState.loaded({
    required List<Invoice> invoices,
  }) = _Loaded;
  const factory BillingState.invoiceDetail({
    required Invoice invoice,
    required List<InvoiceItem> items,
    required List<Payment> payments,
  }) = _InvoiceDetail;
  const factory BillingState.error({
    required String message,
  }) = _Error;
}