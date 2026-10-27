part of 'invoice_detail_cubit.dart';

@freezed
class InvoiceDetailState with _$InvoiceDetailState {
  const factory InvoiceDetailState.loading() = _Loading;
  const factory InvoiceDetailState.loaded({
    required BillingInvoiceDetail detail,
  }) = _Loaded;
  const factory InvoiceDetailState.error({required String message}) = _Error;
}
