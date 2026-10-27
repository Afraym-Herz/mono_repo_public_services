part of 'record_payment_cubit.dart';

@freezed
class RecordPaymentState with _$RecordPaymentState {
  const factory RecordPaymentState({
    @Default(true) bool loading,
    @Default(false) bool saving,
    BillingInvoiceDetail? detail,
    Payment? saved,
    String? error,
  }) = _RecordPaymentState;
}
