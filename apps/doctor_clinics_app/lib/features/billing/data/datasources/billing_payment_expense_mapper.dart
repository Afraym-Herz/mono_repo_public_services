import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;

/// Pure Drift row ↔ entity/companion mapping for payments and expenses.
class BillingPaymentExpenseMapper {
  const BillingPaymentExpenseMapper._();

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
  static PaymentsCompanion toPaymentCompanion(entity.Payment p) {
    return PaymentsCompanion(
      id: p.id > 0 ? Value(p.id) : const Value.absent(),
      invoiceId: Value(p.invoiceId),
      patientId: Value(p.patientId),
      receiptNumber: Value(p.receiptNumber),
      amount: Value(p.amountPiasters),
      paymentMethod: Value(p.paymentMethod),
      notes: Value(p.notes),
      createdBy: Value(p.createdBy.toString()),
      createdAt: Value(p.paymentDate),
    );
  }

  /// Maps an [Expense] row to its domain entity.
  static entity.Expense toDomainExpense(Expense row) {
    return entity.Expense(
      id: row.id,
      category: row.categoryId.toString(),
      description: row.description ?? '',
      amountPiasters: row.amount,
      expenseDate: row.expenseDate,
      notes: row.notes,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.expenseDate,
      updatedAt: row.expenseDate,
    );
  }

  /// Maps an [entity.Expense] to an [ExpensesCompanion].
  static ExpensesCompanion toExpenseCompanion(entity.Expense e) {
    return ExpensesCompanion(
      id: e.id > 0 ? Value(e.id) : const Value.absent(),
      categoryId: Value(int.tryParse(e.category) ?? 1),
      amount: Value(e.amountPiasters),
      description: Value(e.description),
      notes: Value(e.notes),
      expenseDate: Value(e.expenseDate),
      createdBy: Value(e.createdBy.toString()),
    );
  }

  /// Maps an [ExpenseCategory] row to the domain lookup entity.
  static entity.BillingExpenseCategory toDomainCategory(ExpenseCategory row) {
    return entity.BillingExpenseCategory(id: row.id, name: row.name);
  }
}
