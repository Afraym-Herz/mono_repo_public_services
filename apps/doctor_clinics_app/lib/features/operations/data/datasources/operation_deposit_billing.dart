import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/finance/data/receipt_numbers.dart';
import 'package:doctor_clinics_app/features/billing/domain/helpers/billing_status.dart';

/// Creates the billing side of a scheduled operation.
///
/// Plan rule: the deposit creates a payment record. The operation's full cost
/// becomes an `operation` invoice so the remaining balance stays visible in the
/// ledger, and the paid deposit is recorded as one receipt against it.
///
/// Must run inside the caller's Drift transaction so an operation can never be
/// persisted without its invoice. Returns `null` when there is nothing to bill.
Future<int?> recordOperationBilling({
  required BillingDao billingDao,
  required int operationId,
  required int patientId,
  required String description,
  required int totalPiasters,
  required int depositPiasters,
  required DateTime createdAt,
  required String createdBy,
  String? status,
}) async {
  // A cancelled operation keeps its audit row but must not enter the ledger.
  if (status == AppConstants.operationStatusCancelled) return null;

  final total = math.max(totalPiasters, depositPiasters);
  if (total <= 0) return null;

  final paid = math.min(depositPiasters, total);
  final invoiceId = await billingDao.insertInvoice(
    InvoicesCompanion.insert(
      patientId: Value(patientId),
      operationId: Value(operationId),
      invoiceNumber: 'OP-$operationId',
      totalAmount: total,
      discountAmount: 0,
      netAmount: paid,
      status: resolveInvoiceStatus(totalPiasters: total, paidPiasters: paid),
      createdAt: Value(createdAt),
    ),
  );

  await billingDao.insertInvoiceItem(
    InvoiceItemsCompanion.insert(
      invoiceId: invoiceId,
      itemType: AppConstants.invoiceItemTypeOperation,
      description: description,
      quantity: 1,
      unitPrice: total,
      totalPrice: total,
    ),
  );

  if (paid > 0) {
    final payments = await billingDao.getAllPayments();
    await billingDao.insertPayment(
      PaymentsCompanion.insert(
        invoiceId: invoiceId,
        patientId: Value(patientId),
        receiptNumber: nextReceiptNumber(
          'RCP',
          payments.map((payment) => payment.receiptNumber),
        ),
        amount: paid,
        paymentMethod: AppConstants.paymentMethodCash,
        notes: const Value('Operation deposit'),
        createdBy: createdBy,
        createdAt: Value(createdAt),
      ),
    );
  }

  return invoiceId;
}
