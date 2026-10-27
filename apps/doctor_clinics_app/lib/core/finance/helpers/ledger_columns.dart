import 'package:flutter/material.dart';

/// Column layout shared by the ledger head and its rows.
class LedgerColumns {
  LedgerColumns._();

  static const int document = 13;
  static const int party = 14;
  static const int statement = 18;
  static const int total = 11;
  static const int paid = 11;
  static const int due = 11;
  static const int date = 10;
  static const int status = 10;

  static const List<FinanceLedgerHeader> headers = [
    FinanceLedgerHeader('billing.ledger.document', document, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.party', party, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.statement', statement, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.total', total, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.paid', paid, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.due', due, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.date', date, alignment: AlignmentDirectional.center),
    FinanceLedgerHeader('billing.ledger.status', status, alignment: AlignmentDirectional.center),
  ];
}

/// One header cell: its translation key, flex weight and alignment.
class FinanceLedgerHeader {
  const FinanceLedgerHeader(this.labelKey, this.flex, {this.alignment = AlignmentDirectional.center});

  final String labelKey;
  final int flex;
  final AlignmentDirectional alignment;
}
