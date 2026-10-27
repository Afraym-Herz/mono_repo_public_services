import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_invoice_mapper.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_payment_mapper.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;

/// Read queries of [BillingDriftDatasource], kept apart from its writes.
mixin BillingDriftReads {
  BillingDao get dao;

  Future<List<entity.Invoice>> fetchAllInvoices() async {
    final rows = await dao.getAllInvoices();
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  Future<entity.Invoice?> fetchInvoice(int id) async {
    final row = await dao.getInvoiceById(id);
    return row == null ? null : BillingInvoiceMapper.toDomainInvoice(row);
  }

  Future<List<entity.Invoice>> fetchByPatient(int patientId) async {
    final rows = await dao.getInvoicesForPatient(patientId);
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }

  Future<List<entity.InvoiceItem>> fetchInvoiceItems(int invoiceId) async {
    final rows = await dao.getInvoiceItems(invoiceId);
    return rows.map(BillingInvoiceMapper.toDomainItem).toList();
  }

  Future<List<entity.InvoiceItem>> fetchAllInvoiceItems() async {
    final rows = await dao.getAllInvoiceItems();
    return rows.map(BillingInvoiceMapper.toDomainItem).toList();
  }

  Future<List<entity.Payment>> fetchPayments(int invoiceId) async {
    final rows = await dao.getPaymentsForInvoice(invoiceId);
    return rows.map(BillingPaymentMapper.toDomainPayment).toList();
  }

  Future<List<entity.Payment>> fetchAllPayments({
    DateTime? from,
    DateTime? to,
  }) async {
    final rows = from != null && to != null
        ? await dao.getPaymentsBetween(from, to)
        : await dao.getAllPayments();
    return rows.map(BillingPaymentMapper.toDomainPayment).toList();
  }

  Future<List<entity.Invoice>> fetchOutstanding() async {
    final rows = await dao.getOutstandingInvoices();
    return rows.map(BillingInvoiceMapper.toDomainInvoice).toList();
  }
}
