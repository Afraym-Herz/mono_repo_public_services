import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart'
    as entity;

/// Concrete Drift implementation of [IBillingDatasource].
class BillingDriftDatasource implements IBillingDatasource {
  final BillingDao dao;

  BillingDriftDatasource(this.dao);

  @override
  Future<List<entity.Invoice>> fetchAllInvoices() async {
    final rows = await dao.getAllInvoices();
    return rows.map(_toDomainInvoice).toList();
  }

  @override
  Future<List<entity.Invoice>> fetchByPatient(int patientId) async {
    final rows = await dao.getInvoicesForPatient(patientId);
    return rows.map(_toDomainInvoice).toList();
  }

  @override
  Future<int> insertInvoice(entity.Invoice invoice) async {
    return dao.insertInvoice(_toInvoiceCompanion(invoice));
  }

  @override
  Future<void> updateInvoice(entity.Invoice invoice) async {
    await dao.updateInvoice(_toInvoiceCompanion(invoice));
  }

  @override
  Future<void> insertInvoiceItem(entity.InvoiceItem item) async {
    await dao.insertInvoiceItem(_toItemCompanion(item));
  }

  @override
  Future<List<entity.InvoiceItem>> fetchInvoiceItems(int invoiceId) async {
    final rows = await dao.getInvoiceItems(invoiceId);
    return rows.map(_toDomainItem).toList();
  }

  @override
  Future<List<entity.Payment>> fetchPayments(int invoiceId) async {
    final rows = await dao.getPaymentsForInvoice(invoiceId);
    return rows.map(_toDomainPayment).toList();
  }

  @override
  Future<int> insertPayment(entity.Payment payment) async {
    return dao.insertPayment(_toPaymentCompanion(payment));
  }

  @override
  Future<List<entity.Invoice>> fetchOutstanding() async {
    final rows = await dao.getOutstandingInvoices();
    return rows.map(_toDomainInvoice).toList();
  }

  @override
  Future<List<entity.Expense>> fetchExpenses({
    DateTime? from,
    DateTime? to,
  }) async {
    final List<Expense> rows;
    if (from != null && to != null) {
      rows = await dao.getExpensesBetween(from, to);
    } else {
      rows = await dao.getAllExpenses();
    }
    return rows.map(_toDomainExpense).toList();
  }

  @override
  Future<int> insertExpense(entity.Expense expense) async {
    return dao.insertExpense(_toExpenseCompanion(expense));
  }

  @override
  Future<void> updateExpense(entity.Expense expense) async {
    await dao.updateExpense(_toExpenseCompanion(expense));
  }

  entity.Invoice _toDomainInvoice(Invoice row) {
    return entity.Invoice(
      id: row.id,
      patientId: row.patientId,
      invoiceNumber: row.invoiceNumber,
      invoiceDate: row.createdAt,
      totalPiasters: row.totalAmount,
      paidPiasters: row.netAmount,
      duePiasters: row.totalAmount - row.netAmount,
      status: row.status,
      createdBy: 0,
      createdAt: row.createdAt,
      updatedAt: row.createdAt,
    );
  }

  InvoicesCompanion _toInvoiceCompanion(entity.Invoice inv) {
    return InvoicesCompanion(
      id: inv.id > 0 ? Value(inv.id) : const Value.absent(),
      patientId: Value(inv.patientId),
      invoiceNumber: Value(inv.invoiceNumber),
      totalAmount: Value(inv.totalPiasters),
      discountAmount: const Value(0),
      netAmount: Value(inv.paidPiasters),
      status: Value(inv.status),
      createdAt: Value(inv.invoiceDate),
    );
  }

  entity.InvoiceItem _toDomainItem(InvoiceItem row) {
    return entity.InvoiceItem(
      id: row.id,
      invoiceId: row.invoiceId,
      description: row.description,
      quantity: row.quantity,
      unitPricePiasters: row.unitPrice,
      totalPiasters: row.totalPrice,
    );
  }

  InvoiceItemsCompanion _toItemCompanion(entity.InvoiceItem item) {
    return InvoiceItemsCompanion(
      id: item.id > 0 ? Value(item.id) : const Value.absent(),
      invoiceId: Value(item.invoiceId),
      itemType: const Value('service'),
      description: Value(item.description),
      quantity: Value(item.quantity),
      unitPrice: Value(item.unitPricePiasters),
      totalPrice: Value(item.totalPiasters),
    );
  }

  entity.Payment _toDomainPayment(Payment row) {
    return entity.Payment(
      id: row.id,
      invoiceId: row.invoiceId,
      receiptNumber: row.receiptNumber,
      amountPiasters: row.amount,
      paymentMethod: row.paymentMethod,
      paymentDate: row.createdAt,
      notes: row.notes,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.createdAt,
    );
  }

  PaymentsCompanion _toPaymentCompanion(entity.Payment p) {
    return PaymentsCompanion(
      id: p.id > 0 ? Value(p.id) : const Value.absent(),
      invoiceId: Value(p.invoiceId),
      patientId: const Value(0),
      receiptNumber: Value(p.receiptNumber),
      amount: Value(p.amountPiasters),
      paymentMethod: Value(p.paymentMethod),
      notes: Value(p.notes),
      createdBy: Value(p.createdBy.toString()),
      createdAt: Value(p.paymentDate),
    );
  }

  entity.Expense _toDomainExpense(Expense row) {
    return entity.Expense(
      id: row.id,
      category: row.categoryId.toString(),
      description: row.description ?? '',
      amountPiasters: row.amount,
      expenseDate: row.expenseDate,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.expenseDate,
      updatedAt: row.expenseDate,
    );
  }

  ExpensesCompanion _toExpenseCompanion(entity.Expense e) {
    return ExpensesCompanion(
      id: e.id > 0 ? Value(e.id) : const Value.absent(),
      categoryId: Value(int.tryParse(e.category) ?? 1),
      amount: Value(e.amountPiasters),
      description: Value(e.description),
      expenseDate: Value(e.expenseDate),
      createdBy: Value(e.createdBy.toString()),
    );
  }
}
