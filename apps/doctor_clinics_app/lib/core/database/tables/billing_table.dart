import 'package:drift/drift.dart';
import 'patients_table.dart';
import 'consultations_table.dart';
import 'operations_table.dart';

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  IntColumn get consultationId => integer().nullable().references(Consultations, #id)();
  IntColumn get operationId => integer().nullable().references(Operations, #id)();
  TextColumn get invoiceNumber => text().unique()();
  IntColumn get totalAmount => integer()(); // integer piasters
  IntColumn get discountAmount => integer()(); // integer piasters
  IntColumn get netAmount => integer()(); // integer piasters
  // See AppConstants.invoiceStatusPending/PartiallyPaid/Paid/Cancelled.
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class InvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().references(Invoices, #id)();
  // See AppConstants.invoiceItemTypeConsultation/Operation/Medicine/Other.
  TextColumn get itemType => text()();
  TextColumn get description => text()();
  IntColumn get quantity => integer()();
  IntColumn get unitPrice => integer()(); // integer piasters
  IntColumn get totalPrice => integer()(); // integer piasters
}

class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().references(Invoices, #id)();
  IntColumn get patientId => integer().references(Patients, #id)();
  TextColumn get receiptNumber => text().unique()();
  IntColumn get amount => integer()(); // integer piasters
  // See AppConstants.paymentMethodCash/Card/Transfer.
  TextColumn get paymentMethod => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text()();
}

class ExpenseCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(ExpenseCategories, #id)();
  IntColumn get amount => integer()(); // integer piasters
  TextColumn get description => text().nullable()();
  DateTimeColumn get expenseDate => dateTime()();
  TextColumn get createdBy => text()();
}
