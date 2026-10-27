import 'package:core/core.dart';

/// Resolves the stored status of a supplier bill from its paid amount.
///
/// Mirrors the invoice rules so a purchase never keeps a stale `pending`
/// status after a partial or full down-payment.
String resolvePurchaseStatus({
  required int totalPiasters,
  required int paidPiasters,
  String? current,
}) {
  if (current == AppConstants.invoiceStatusCancelled) {
    return AppConstants.invoiceStatusCancelled;
  }
  if (paidPiasters <= 0) return AppConstants.invoiceStatusPending;
  return paidPiasters >= totalPiasters
      ? AppConstants.invoiceStatusPaid
      : AppConstants.invoiceStatusPartiallyPaid;
}
