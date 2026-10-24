import 'package:core/core.dart';
import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;

/// Pure Drift row ↔ entity/companion mapping for invoices and their items.
class BillingInvoiceMapper {
  const BillingInvoiceMapper._();

  /// Maps an [Invoice] row to its domain entity.
  static entity.Invoice toDomainInvoice(Invoice row) {
    return entity.Invoice(
      id: row.id,
      patientId: row.patientId,
      type: row.type,
      customerName: row.customerName,
      invoiceNumber: row.invoiceNumber,
      invoiceDate: row.createdAt,
      totalPiasters: row.totalAmount,
      discountPiasters: row.discountAmount,
      paidPiasters: row.netAmount,
      duePiasters: row.totalAmount - row.netAmount,
      status: row.status,
      notes: row.notes,
      createdBy: 0,
      createdAt: row.createdAt,
      updatedAt: row.createdAt,
    );
  }

  /// Maps an [entity.Invoice] to an [InvoicesCompanion].
  static InvoicesCompanion toInvoiceCompanion(entity.Invoice inv) {
    return InvoicesCompanion(
      id: inv.id > 0 ? Value(inv.id) : const Value.absent(),
      patientId: Value(inv.patientId),
      type: Value(inv.type),
      customerName: Value(inv.customerName),
      invoiceNumber: Value(inv.invoiceNumber),
      totalAmount: Value(inv.totalPiasters),
      discountAmount: Value(inv.discountPiasters),
      netAmount: Value(inv.paidPiasters),
      status: Value(inv.status),
      notes: Value(inv.notes),
      createdAt: Value(inv.invoiceDate),
    );
  }

  /// Maps an [InvoiceItem] row to its domain entity.
  static entity.InvoiceItem toDomainItem(InvoiceItem row) {
    return entity.InvoiceItem(
      id: row.id,
      invoiceId: row.invoiceId,
      description: row.description,
      quantity: row.quantity,
      unitPricePiasters: row.unitPrice,
      totalPiasters: row.totalPrice,
    );
  }

  /// Maps an [entity.InvoiceItem] to an [InvoiceItemsCompanion].
  static InvoiceItemsCompanion toItemCompanion(entity.InvoiceItem item) {
    return InvoiceItemsCompanion(
      id: item.id > 0 ? Value(item.id) : const Value.absent(),
      invoiceId: Value(item.invoiceId),
      itemType: const Value(AppConstants.invoiceItemTypeService),
      description: Value(item.description),
      quantity: Value(item.quantity),
      unitPrice: Value(item.unitPricePiasters),
      totalPrice: Value(item.totalPiasters),
    );
  }
}
