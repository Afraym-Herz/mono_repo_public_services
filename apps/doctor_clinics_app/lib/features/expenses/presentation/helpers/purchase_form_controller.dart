import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';
import 'package:doctor_clinics_app/core/finance/domain/form_totals.dart';
import 'package:doctor_clinics_app/core/finance/domain/line_item_draft.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/new_purchase_draft.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/purchase_draft_builder.dart';

/// Holds the supplier-bill fields without rebuilding the whole dialog.
class PurchaseFormController {
  PurchaseFormController({required this.repository}) {
    paidNow.addListener(_bump);
    lines.add(FinanceLineItemDraft(onChanged: _bump));
    loadVendors();
  }

  final IExpensesRepository repository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController notes = TextEditingController();
  final TextEditingController paidNow = TextEditingController();
  final ValueNotifier<Vendor?> vendor = ValueNotifier(null);
  final ValueNotifier<DateTime> date = ValueNotifier(DateTime.now());
  final ValueNotifier<String> paymentMethod = ValueNotifier(
    AppConstants.paymentMethodCash,
  );
  final ValueNotifier<int> revision = ValueNotifier(0);
  final ValueNotifier<int> linesRevision = ValueNotifier(0);
  final List<FinanceLineItemDraft> lines = [];

  List<Vendor> vendors = const [];
  bool vendorsLoading = true;
  String? vendorsError;
  bool _disposed = false;

  FinanceFormTotals get totals => FinanceFormTotals.compute(
    lines: lines,
    discountText: '',
    paidText: paidNow.text,
  );

  Future<void> loadVendors() async {
    vendorsLoading = true;
    vendorsError = null;
    revision.value++;
    final result = await repository.getVendors();
    if (_disposed) return;
    final failure = result.fold((error) => error.message, (_) => null);
    if (failure != null) {
      vendorsError = failure;
    } else {
      vendors = result.getOrElse(() => const <Vendor>[]);
    }
    vendorsLoading = false;
    revision.value++;
  }

  void addVendor(Vendor value) {
    vendors = [...vendors, value];
    vendor.value = value;
    revision.value++;
  }

  void _bump() => revision.value++;

  void addLine() {
    lines.add(FinanceLineItemDraft(onChanged: _bump));
    linesRevision.value++;
    _bump();
  }

  void removeLine(FinanceLineItemDraft line) {
    if (lines.length <= 1) return;
    lines.remove(line);
    line.dispose();
    linesRevision.value++;
    _bump();
  }

  NewPurchaseDraft? toDraft() => PurchaseDraftBuilder.build(this);

  void dispose() {
    _disposed = true;
    notes.dispose();
    paidNow.dispose();
    vendor.dispose();
    date.dispose();
    paymentMethod.dispose();
    revision.dispose();
    linesRevision.dispose();
    for (final line in lines) {
      line.dispose();
    }
  }
}
