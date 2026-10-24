import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart'
    as entity;

/// Pure Drift row ↔ entity/companion mapping for suppliers and purchases.
class BillingPurchaseMapper {
  const BillingPurchaseMapper._();

  static entity.Vendor toDomainVendor(Vendor row) => entity.Vendor(
    id: row.id,
    name: row.name,
    phone: row.phone,
    notes: row.notes,
    createdAt: row.createdAt,
  );

  static VendorsCompanion toVendorCompanion(entity.Vendor vendor) =>
      VendorsCompanion(
        id: vendor.id > 0 ? Value(vendor.id) : const Value.absent(),
        name: Value(vendor.name),
        phone: Value(vendor.phone),
        notes: Value(vendor.notes),
        createdAt: Value(vendor.createdAt),
      );

  static entity.Purchase toDomainPurchase(Purchase row) => entity.Purchase(
    id: row.id,
    vendorId: row.vendorId,
    purchaseNumber: row.purchaseNumber,
    purchaseDate: row.purchaseDate,
    totalPiasters: row.totalAmount,
    paidPiasters: row.paidAmount,
    duePiasters: math.max(0, row.totalAmount - row.paidAmount),
    status: row.status,
    notes: row.notes,
    createdBy: 0,
    createdAt: row.createdAt,
    updatedAt: row.createdAt,
  );

  static PurchasesCompanion toPurchaseCompanion(entity.Purchase purchase) =>
      PurchasesCompanion(
        id: purchase.id > 0 ? Value(purchase.id) : const Value.absent(),
        vendorId: Value(purchase.vendorId),
        purchaseNumber: Value(purchase.purchaseNumber),
        totalAmount: Value(purchase.totalPiasters),
        paidAmount: Value(purchase.paidPiasters),
        status: Value(purchase.status),
        notes: Value(purchase.notes),
        purchaseDate: Value(purchase.purchaseDate),
        createdAt: Value(purchase.purchaseDate),
      );

  static entity.PurchaseItem toDomainItem(PurchaseItem row) =>
      entity.PurchaseItem(
        id: row.id,
        purchaseId: row.purchaseId,
        description: row.description,
        quantity: row.quantity,
        unitCostPiasters: row.unitCost,
        totalPiasters: row.totalCost,
      );

  static PurchaseItemsCompanion toItemCompanion(entity.PurchaseItem item) =>
      PurchaseItemsCompanion(
        id: item.id > 0 ? Value(item.id) : const Value.absent(),
        purchaseId: Value(item.purchaseId),
        description: Value(item.description),
        quantity: Value(item.quantity),
        unitCost: Value(item.unitCostPiasters),
        totalCost: Value(item.totalPiasters),
      );

  static entity.PurchasePayment toDomainPayment(PurchasePayment row) =>
      entity.PurchasePayment(
        id: row.id,
        purchaseId: row.purchaseId,
        vendorId: row.vendorId,
        receiptNumber: row.receiptNumber,
        amountPiasters: row.amount,
        paymentMethod: row.paymentMethod,
        paymentDate: row.createdAt,
        notes: row.notes,
        createdBy: int.tryParse(row.createdBy) ?? 0,
        createdAt: row.createdAt,
      );

  static PurchasePaymentsCompanion toPaymentCompanion(
    entity.PurchasePayment payment,
  ) => PurchasePaymentsCompanion(
    id: payment.id > 0 ? Value(payment.id) : const Value.absent(),
    purchaseId: Value(payment.purchaseId),
    vendorId: Value(payment.vendorId),
    receiptNumber: Value(payment.receiptNumber),
    amount: Value(payment.amountPiasters),
    paymentMethod: Value(payment.paymentMethod),
    notes: Value(payment.notes),
    createdAt: Value(payment.paymentDate),
    createdBy: Value(payment.createdBy.toString()),
  );
}
