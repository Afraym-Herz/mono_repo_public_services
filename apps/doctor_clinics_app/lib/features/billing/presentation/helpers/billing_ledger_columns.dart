/// Column layout shared by the ledger head and its rows.
class BillingLedgerColumns {
  BillingLedgerColumns._();

  static const int document = 13;
  static const int type = 10;
  static const int party = 14;
  static const int statement = 18;
  static const int total = 11;
  static const int paid = 11;
  static const int due = 11;
  static const int date = 10;
  static const int status = 10;

  static const List<BillingLedgerHeader> headers = [
    BillingLedgerHeader('billing.ledger.document', document),
    BillingLedgerHeader('billing.ledger.type', type, centered: true),
    BillingLedgerHeader('billing.ledger.party', party),
    BillingLedgerHeader('billing.ledger.statement', statement),
    BillingLedgerHeader('billing.ledger.total', total, centered: true),
    BillingLedgerHeader('billing.ledger.paid', paid, centered: true),
    BillingLedgerHeader('billing.ledger.due', due, centered: true),
    BillingLedgerHeader('billing.ledger.date', date, centered: true),
    BillingLedgerHeader('billing.ledger.status', status, centered: true),
  ];
}

/// One header cell: its translation key, flex weight and alignment.
class BillingLedgerHeader {
  const BillingLedgerHeader(this.labelKey, this.flex, {this.centered = false});

  final String labelKey;
  final int flex;
  final bool centered;
}
