import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/finance/data/finance_guard.dart';
import 'package:doctor_clinics_app/core/finance/data/receipt_numbers.dart' as receipts;
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_datasource.dart';
import 'package:doctor_clinics_app/features/expenses/data/repositories/expenses_payment_sync.dart';
import 'package:doctor_clinics_app/features/expenses/data/repositories/expenses_repository_reads.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';

class ExpensesRepositoryImpl
    with ExpensesRepositoryReads
    implements IExpensesRepository {
  @override
  final IExpensesDatasource datasource;

  ExpensesRepositoryImpl({required this.datasource});

  @override
  FutureResult<Expense> addExpense(Expense expense) => guardFinanceValue(
    'addExpense',
    () async => expense.copyWith(id: await datasource.insertExpense(expense)),
  );

  @override
  FutureResult<void> updateExpense(Expense expense) => guardFinanceVoid(
    'updateExpense',
    () => datasource.updateExpense(expense),
  );

  @override
  FutureResult<ExpenseCategoryEntity> addExpenseCategory(String name) =>
      guardFinanceValue('addExpenseCategory', () async {
        final id = await datasource.insertExpenseCategory(name);
        return ExpenseCategoryEntity(id: id, name: name);
      });

  @override
  FutureResult<Vendor> addVendor(Vendor vendor) => guardFinanceValue(
    'addVendor',
    () async => vendor.copyWith(id: await datasource.insertVendor(vendor)),
  );

  @override
  FutureResult<Purchase> createPurchase(Purchase purchase) =>
      guardFinanceValue(
        'createPurchase',
        () async =>
            purchase.copyWith(id: await datasource.insertPurchase(purchase)),
      );

  @override
  FutureResult<void> addPurchaseItem(PurchaseItem item) => guardFinanceVoid(
    'addPurchaseItem',
    () => datasource.insertPurchaseItem(item),
  );

  @override
  FutureResult<PurchasePayment> recordPurchasePayment(
    PurchasePayment payment,
  ) => guardFinanceValue(
    'recordPurchasePayment',
    () => insertPurchasePaymentWithSync(datasource, payment),
  );

  @override
  FutureResult<String> nextPurchaseReceiptNumber() => guardFinanceValue(
    'nextPurchaseReceiptNumber',
    () async => receipts.nextReceiptNumber(
      'PUR-RCP',
      (await datasource.fetchAllPurchasePayments()).map(
        (payment) => payment.receiptNumber,
      ),
    ),
  );
}
