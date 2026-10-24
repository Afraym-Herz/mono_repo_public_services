import 'dart:math' as math;

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_line_draft.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_status_resolver.dart';

/// Live subtotal/discount/total/paid/due figures of the invoice form.
class InvoiceFormTotals {
  const InvoiceFormTotals({
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.paid,
    required this.due,
    required this.status,
  });

  final int subtotal;
  final int discount;
  final int total;
  final int paid;
  final int due;
  final String status;

  factory InvoiceFormTotals.compute({
    required List<InvoiceLineDraft> lines,
    required String discountText,
    required String paidText,
  }) {
    final subtotal = lines.fold<int>(
      0,
      (sum, line) => sum + line.totalPiasters,
    );
    final discount = MoneyInput.tryParsePiasters(discountText) ?? 0;
    final paid = MoneyInput.tryParsePiasters(paidText) ?? 0;
    final total = math.max(0, subtotal - discount);
    return InvoiceFormTotals(
      subtotal: subtotal,
      discount: discount,
      total: total,
      paid: paid,
      due: math.max(0, total - paid),
      status: InvoiceStatusResolver.resolve(
        totalPiasters: total,
        paidPiasters: paid,
      ),
    );
  }
}
