import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_draft_builder.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_form_totals.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_line_draft.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_patient_source.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/new_invoice_draft.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Which kind of income document the invoice form records.
enum InvoiceFormMode {
  /// Classic patient invoice tied to a patient file.
  patient,

  /// Walk-in sale or other income that is not tied to a patient.
  nonPatient,
}

/// Holds the new-invoice fields without rebuilding the whole dialog.
class InvoiceFormController {
  InvoiceFormController({this.mode = InvoiceFormMode.patient}) {
    discount.addListener(_bump);
    paidNow.addListener(_bump);
    lines.add(InvoiceLineDraft(onChanged: _bump));
    if (mode == InvoiceFormMode.patient) {
      patientSource = InvoicePatientSource();
    }
  }

  final InvoiceFormMode mode;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController patientSearch = TextEditingController();
  final TextEditingController customer = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController discount = TextEditingController();
  final TextEditingController paidNow = TextEditingController();
  final ValueNotifier<Patient?> patient = ValueNotifier(null);
  final ValueNotifier<String> incomeType = ValueNotifier(
    AppConstants.invoiceTypeSale,
  );
  final ValueNotifier<DateTime> date = ValueNotifier(DateTime.now());
  final ValueNotifier<String> paymentMethod = ValueNotifier(
    AppConstants.paymentMethodCash,
  );
  final ValueNotifier<int> revision = ValueNotifier(0);
  final ValueNotifier<int> linesRevision = ValueNotifier(0);
  final List<InvoiceLineDraft> lines = [];

  /// Loaded only for patient invoices; sales and income skip the patient list.
  InvoicePatientSource? patientSource;

  Future<List<Patient>> get patients =>
      patientSource?.patients ?? Future.value(const []);

  List<Patient>? get lastPatients => patientSource?.lastPatients;

  InvoiceFormTotals get totals => InvoiceFormTotals.compute(
    lines: lines,
    discountText: discount.text,
    paidText: paidNow.text,
  );

  void _bump() => revision.value++;

  void addLine() {
    lines.add(InvoiceLineDraft(onChanged: _bump));
    linesRevision.value++;
    _bump();
  }

  void removeLine(InvoiceLineDraft line) {
    if (lines.length <= 1) return;
    lines.remove(line);
    line.dispose();
    linesRevision.value++;
    _bump();
  }

  void selectPatient(Patient value) {
    patient.value = value;
    patientSearch.text = value.fullName;
    patientSearch.selection = TextSelection.collapsed(
      offset: patientSearch.text.length,
    );
  }

  void addPatient(Patient value) {
    patientSource?.add(value);
    selectPatient(value);
  }

  NewInvoiceDraft? toDraft() => InvoiceDraftBuilder.build(this);

  void dispose() {
    patientSearch.dispose();
    customer.dispose();
    notes.dispose();
    discount.dispose();
    paidNow.dispose();
    patient.dispose();
    incomeType.dispose();
    date.dispose();
    paymentMethod.dispose();
    revision.dispose();
    linesRevision.dispose();
    for (final line in lines) {
      line.dispose();
    }
  }
}
