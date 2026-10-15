import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';

class BillingRepositoryImpl implements IBillingRepository {
  final IBillingDatasource datasource;

  BillingRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Invoice>> getAllInvoices() async {
    try {
      final list = await datasource.fetchAllInvoices();
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('billing.getAllInvoices failed: $e'));
    }
  }

  @override
  FutureResult<List<Invoice>> getByPatient(int patientId) async {
    try {
      final list = await datasource.fetchByPatient(patientId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('billing.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<Invoice> createInvoice(Invoice invoice) async {
    try {
      final id = await datasource.insertInvoice(invoice);
      return Right(invoice.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('billing.createInvoice failed: $e'));
    }
  }

  @override
  FutureResult<void> addInvoiceItem(InvoiceItem item) async {
    try {
      await datasource.insertInvoiceItem(item);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('billing.addInvoiceItem failed: $e'));
    }
  }

  @override
  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId) async {
    try {
      final list = await datasource.fetchInvoiceItems(invoiceId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('billing.getInvoiceItems failed: $e'));
    }
  }

  @override
  FutureResult<List<Payment>> getPayments(int invoiceId) async {
    try {
      final list = await datasource.fetchPayments(invoiceId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('billing.getPayments failed: $e'));
    }
  }

  @override
  FutureResult<Payment> recordPayment(Payment payment) async {
    try {
      final id = await datasource.insertPayment(payment);
      return Right(payment.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('billing.recordPayment failed: $e'));
    }
  }

  @override
  FutureResult<String> nextReceiptNumber() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      return Right('RCP-$timestamp');
    } catch (e) {
      return Left(CacheFailure('billing.nextReceiptNumber failed: $e'));
    }
  }

  @override
  FutureResult<List<Invoice>> getOutstandingInvoices() async {
    try {
      final list = await datasource.fetchOutstanding();
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('billing.getOutstandingInvoices failed: $e'));
    }
  }

  @override
  FutureResult<int> getPatientDebt(int patientId) async {
    try {
      final invoices = await datasource.fetchByPatient(patientId);
      var debt = 0;
      for (final inv in invoices) {
        debt += inv.duePiasters;
      }
      return Right(debt);
    } catch (e) {
      return Left(CacheFailure('billing.getPatientDebt failed: $e'));
    }
  }

  @override
  FutureResult<List<Expense>> getExpenses({
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final list = await datasource.fetchExpenses(from: from, to: to);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('billing.getExpenses failed: $e'));
    }
  }

  @override
  FutureResult<Expense> addExpense(Expense expense) async {
    try {
      final id = await datasource.insertExpense(expense);
      return Right(expense.copyWith(id: id));
    } catch (e) {
      return Left(CacheFailure('billing.addExpense failed: $e'));
    }
  }

  @override
  FutureResult<void> updateExpense(Expense expense) async {
    try {
      await datasource.updateExpense(expense);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('billing.updateExpense failed: $e'));
    }
  }

  @override
  FutureResult<int> getDailyRevenuePiasters(DateTime date) async {
    try {
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1));
      final expenses = await datasource.fetchExpenses(from: start, to: end);
      var total = 0;
      for (final e in expenses) {
        total += e.amountPiasters;
      }
      return Right(total);
    } catch (e) {
      return Left(CacheFailure('billing.getDailyRevenuePiasters failed: $e'));
    }
  }

  @override
  FutureResult<int> getDailyExpensesPiasters(DateTime date) async {
    try {
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1));
      final expenses = await datasource.fetchExpenses(from: start, to: end);
      var total = 0;
      for (final e in expenses) {
        total += e.amountPiasters;
      }
      return Right(total);
    } catch (e) {
      return Left(CacheFailure('billing.getDailyExpensesPiasters failed: $e'));
    }
  }
}
