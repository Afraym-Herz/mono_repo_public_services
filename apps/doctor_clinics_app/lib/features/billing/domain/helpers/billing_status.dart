import 'package:core/core.dart';

/// Resolves the stored status of an invoice from its paid amount.
///
/// A cancelled document keeps its status; any other document follows the
/// paid/total figures so partial payments never leave a stale `pending` row.
String resolveInvoiceStatus({
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
