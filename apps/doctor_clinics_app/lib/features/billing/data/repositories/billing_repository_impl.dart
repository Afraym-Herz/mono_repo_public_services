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
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getAllInvoices failed: $e'));
    }
  }

  @override
  FutureResult<List<Invoice>> getByPatient(int patientId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<Invoice> createInvoice(Invoice invoice) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.createInvoice failed: $e'));
    }
  }

  @override
  FutureResult<void> addInvoiceItem(InvoiceItem item) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.addInvoiceItem failed: $e'));
    }
  }

  @override
  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getInvoiceItems failed: $e'));
    }
  }

  @override
  FutureResult<List<Payment>> getPayments(int invoiceId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getPayments failed: $e'));
    }
  }

  @override
  FutureResult<Payment> recordPayment(Payment payment) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.recordPayment failed: $e'));
    }
  }

  @override
  FutureResult<String> nextReceiptNumber() async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.nextReceiptNumber failed: $e'));
    }
  }

  @override
  FutureResult<List<Invoice>> getOutstandingInvoices() async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getOutstandingInvoices failed: $e'));
    }
  }

  @override
  FutureResult<int> getPatientDebt(int patientId) async {
    try {
      throw UnimplementedError();
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
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getExpenses failed: $e'));
    }
  }

  @override
  FutureResult<Expense> addExpense(Expense expense) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.addExpense failed: $e'));
    }
  }

  @override
  FutureResult<void> updateExpense(Expense expense) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.updateExpense failed: $e'));
    }
  }

  @override
  FutureResult<int> getDailyRevenuePiasters(DateTime date) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getDailyRevenuePiasters failed: $e'));
    }
  }

  @override
  FutureResult<int> getDailyExpensesPiasters(DateTime date) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('billing.getDailyExpensesPiasters failed: $e'));
    }
  }
}
