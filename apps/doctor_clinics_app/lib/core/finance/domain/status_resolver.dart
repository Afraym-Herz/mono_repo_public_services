import 'package:core/core.dart';

/// Computes the invoice status from the amounts entered in the form.
class FinanceStatusResolver {
  FinanceStatusResolver._();

  static String resolve({
    required int totalPiasters,
    required int paidPiasters,
  }) {
    if (paidPiasters <= 0) return AppConstants.invoiceStatusPending;
    return paidPiasters >= totalPiasters
        ? AppConstants.invoiceStatusPaid
        : AppConstants.invoiceStatusPartiallyPaid;
  }
}
