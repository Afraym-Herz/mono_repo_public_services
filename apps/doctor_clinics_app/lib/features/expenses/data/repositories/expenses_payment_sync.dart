import 'dart:math' as math;

import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_datasource.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/helpers/purchase_status.dart';

/// Inserts a supplier receipt and re-syncs the purchase paid/due/status header.
Future<PurchasePayment> insertPurchasePaymentWithSync(
  IExpensesDatasource datasource,
  PurchasePayment payment,
) async {
  final id = await datasource.insertPurchasePayment(payment);
  final purchase = await datasource.fetchPurchase(payment.purchaseId);
  if (purchase != null) {
    final paid = purchase.paidPiasters + payment.amountPiasters;
    await datasource.updatePurchase(
      purchase.copyWith(
        paidPiasters: paid,
        duePiasters: math.max(0, purchase.totalPiasters - paid),
        status: resolvePurchaseStatus(
          totalPiasters: purchase.totalPiasters,
          paidPiasters: paid,
          current: purchase.status,
        ),
        updatedAt: DateTime.now(),
      ),
    );
  }
  return payment.copyWith(id: id);
}
