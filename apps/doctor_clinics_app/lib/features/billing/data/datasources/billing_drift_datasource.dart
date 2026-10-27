import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_drift_reads.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_invoice_mapper.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_payment_mapper.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;

/// Concrete Drift implementation of [IBillingDatasource].
class BillingDriftDatasource
    with BillingDriftReads
    implements IBillingDatasource {
  @override
  final BillingDao dao;

  BillingDriftDatasource(this.dao);

  @override
  Future<int> insertInvoice(entity.Invoice invoice) async {
    return dao.insertInvoice(BillingInvoiceMapper.toInvoiceCompanion(invoice));
  }

  @override
  Future<void> updateInvoice(entity.Invoice invoice) async {
    await dao.updateInvoice(BillingInvoiceMapper.toInvoiceCompanion(invoice));
  }

  @override
  Future<void> insertInvoiceItem(entity.InvoiceItem item) async {
    await dao.insertInvoiceItem(BillingInvoiceMapper.toItemCompanion(item));
  }

  @override
  Future<int> insertPayment(entity.Payment payment) {
    return dao.insertPayment(
      BillingPaymentMapper.toPaymentCompanion(payment),
    );
  }
}
