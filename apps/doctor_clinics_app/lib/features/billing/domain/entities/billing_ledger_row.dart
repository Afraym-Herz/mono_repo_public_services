import 'package:core/core.dart';

/// One invoice or supplier-purchase row shown in the accounts ledgers.
class BillingLedgerRow {
  const BillingLedgerRow({
    required this.id,
    required this.number,
    required this.receiptNumber,
    required this.type,
    required this.counterparty,
    required this.statement,
    required this.totalPiasters,
    required this.paidPiasters,
    required this.duePiasters,
    required this.date,
    required this.status,
  });

  final int id;
  final String number;
  final String receiptNumber;
  final String type;
  final String counterparty;
  final String statement;
  final int totalPiasters;
  final int paidPiasters;
  final int duePiasters;
  final DateTime date;
  final String status;

  bool get isPaid => duePiasters <= 0;

  bool get isPurchase => type == AppConstants.billingTypePurchase;
}
