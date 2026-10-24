import 'package:drift/drift.dart';
import 'patients_table.dart';
import 'consultations_table.dart';
import 'operations_table.dart';

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId =>
      integer().nullable().references(Patients, #id)();
  IntColumn get consultationId =>
      integer().nullable().references(Consultations, #id)();
  IntColumn get operationId => integer().nullable().references(Operations, #id)();
  TextColumn get invoiceNumber => text().unique()();
  // See AppConstants.invoiceTypePatient/Sale/OtherIncome.
  TextColumn get type => text().withDefault(const Constant('patient'))();
  // Walk-in / non-patient customer name for sale and other-income invoices.
  TextColumn get customerName => text().nullable()();
  IntColumn get totalAmount => integer()(); // integer piasters
  IntColumn get discountAmount => integer()(); // integer piasters
  IntColumn get netAmount => integer()(); // integer piasters
  // See AppConstants.invoiceStatusPending/PartiallyPaid/Paid/Cancelled.
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
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
  IntColumn get patientId =>
      integer().nullable().references(Patients, #id)();
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
  TextColumn get notes => text().nullable()();
  DateTimeColumn get expenseDate => dateTime()();
  TextColumn get createdBy => text()();
}

/// Suppliers / shops the clinic buys tools, equipment and supplies from.
class Vendors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Supplier bills (money out), e.g. buying new tools or equipment.
class Purchases extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get vendorId => integer().nullable().references(Vendors, #id)();
  TextColumn get purchaseNumber => text().unique()();
  IntColumn get totalAmount => integer()(); // integer piasters
  IntColumn get paidAmount => integer()(); // integer piasters
  // See AppConstants.invoiceStatusPending/PartiallyPaid/Paid.
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get purchaseDate => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PurchaseItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get purchaseId => integer().references(Purchases, #id)();
  TextColumn get description => text()();
  IntColumn get quantity => integer()();
  IntColumn get unitCost => integer()(); // integer piasters
  IntColumn get totalCost => integer()(); // integer piasters
}

class PurchasePayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get purchaseId => integer().references(Purchases, #id)();
  IntColumn get vendorId => integer().nullable().references(Vendors, #id)();
  TextColumn get receiptNumber => text().unique()();
  IntColumn get amount => integer()(); // integer piasters
  TextColumn get paymentMethod => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text()();
}
