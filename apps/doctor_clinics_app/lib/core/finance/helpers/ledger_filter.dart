import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';

/// Case-insensitive search shared by the finance ledger tables.
class LedgerFilter {
  LedgerFilter._();

  static List<LedgerRow> rows(List<LedgerRow> rows, String query) {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return rows;
    return rows.where((row) {
      return row.counterparty.toLowerCase().contains(needle) ||
          row.number.toLowerCase().contains(needle) ||
          row.receiptNumber.toLowerCase().contains(needle) ||
          row.statement.toLowerCase().contains(needle);
    }).toList();
  }
}
