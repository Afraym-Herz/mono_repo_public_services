import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/finance/data/finance_guard.dart';
import 'package:doctor_clinics_app/core/finance/data/receipt_numbers.dart' as receipts;
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_payment_sync.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_reads.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

class BillingRepositoryImpl
    with BillingRepositoryReads
    implements IBillingRepository {
  @override
  final IBillingDatasource datasource;

  BillingRepositoryImpl({required this.datasource});

  @override
  FutureResult<Invoice> createInvoice(Invoice invoice) => guardFinanceValue(
    'createInvoice',
    () async => invoice.copyWith(id: await datasource.insertInvoice(invoice)),
  );

  @override
  FutureResult<void> addInvoiceItem(InvoiceItem item) => guardFinanceVoid(
    'addInvoiceItem',
    () => datasource.insertInvoiceItem(item),
  );

  @override
  FutureResult<Payment> recordPayment(Payment payment) => guardFinanceValue(
    'recordPayment',
    () => insertPaymentWithSync(datasource, payment),
  );

  @override
  FutureResult<String> nextReceiptNumber() => guardFinanceValue(
    'nextReceiptNumber',
    () async => receipts.nextReceiptNumber(
      'RCP',
      (await datasource.fetchAllPayments()).map(
        (payment) => payment.receiptNumber,
      ),
    ),
  );
}
