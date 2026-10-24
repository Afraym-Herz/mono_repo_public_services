import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';

/// Turns supplier bills into the same row shape the ledger table renders.
class BillingPurchaseLedgerBuilder {
  BillingPurchaseLedgerBuilder._();

  static List<BillingLedgerRow> build({
    required List<Purchase> purchases,
    required List<PurchaseItem> items,
    required List<PurchasePayment> payments,
    required Map<int, String> vendorNames,
  }) {
    final statements = _statements(items);
    final receipts = _latestReceipts(payments);
    final rows = purchases.map((purchase) {
      final vendorId = purchase.vendorId;
      return BillingLedgerRow(
        id: purchase.id,
        number: purchase.purchaseNumber,
        receiptNumber: receipts[purchase.id] ?? '',
        type: AppConstants.billingTypePurchase,
        counterparty: vendorId == null ? '' : vendorNames[vendorId] ?? '',
        statement: statements[purchase.id] ?? '',
        totalPiasters: purchase.totalPiasters,
        paidPiasters: purchase.paidPiasters,
        duePiasters: purchase.duePiasters,
        date: purchase.purchaseDate,
        status: purchase.status,
      );
    }).toList();

    rows.sort((a, b) => b.date.compareTo(a.date));
    return rows;
  }

  static Map<int, String> _statements(List<PurchaseItem> items) {
    final byPurchase = <int, String>{};
    for (final item in items) {
      if (byPurchase.containsKey(item.purchaseId)) continue;
      if (item.description.trim().isEmpty) continue;
      byPurchase[item.purchaseId] = item.description;
    }
    return byPurchase;
  }

  static Map<int, String> _latestReceipts(List<PurchasePayment> payments) {
    final ordered = [...payments]
      ..sort((a, b) => a.paymentDate.compareTo(b.paymentDate));
    final byPurchase = <int, String>{};
    for (final payment in ordered) {
      byPurchase[payment.purchaseId] = payment.receiptNumber;
    }
    return byPurchase;
  }
}
