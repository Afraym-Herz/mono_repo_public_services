import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;

/// Pure Drift row ↔ entity/companion mapping for invoice receipts.
class BillingPaymentMapper {
  const BillingPaymentMapper._();

  /// Maps a [Payment] row to its domain entity.
  static entity.Payment toDomainPayment(Payment row) {
    return entity.Payment(
      id: row.id,
      invoiceId: row.invoiceId,
      patientId: row.patientId,
      receiptNumber: row.receiptNumber,
      amountPiasters: row.amount,
      paymentMethod: row.paymentMethod,
      paymentDate: row.createdAt,
      notes: row.notes,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.createdAt,
    );
  }

  /// Maps an [entity.Payment] to a [PaymentsCompanion].
  static PaymentsCompanion toPaymentCompanion(entity.Payment payment) {
    return PaymentsCompanion(
      id: payment.id > 0 ? Value(payment.id) : const Value.absent(),
      invoiceId: Value(payment.invoiceId),
      patientId: Value(payment.patientId),
      receiptNumber: Value(payment.receiptNumber),
      amount: Value(payment.amountPiasters),
      paymentMethod: Value(payment.paymentMethod),
      notes: Value(payment.notes),
      createdBy: Value(payment.createdBy.toString()),
      createdAt: Value(payment.paymentDate),
    );
  }
}
