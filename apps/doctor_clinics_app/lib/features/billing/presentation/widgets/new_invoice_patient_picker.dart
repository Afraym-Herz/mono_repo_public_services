import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_form_dialog.dart';

import '../helpers/invoice_form_controller.dart';
import 'new_invoice_patient_search_field.dart';

/// Patient step of the new-invoice form.
class NewInvoicePatientPicker extends StatelessWidget {
  const NewInvoicePatientPicker({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'billing.invoice_form.patient'.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: context.clinicTextSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () => _addPatient(context),
              icon: const Icon(Icons.person_add_alt_1_outlined, size: 18),
              label: Text('billing.invoice_form.new_patient'.tr()),
            ),
          ],
        ),
        NewInvoicePatientSearchField(controller: controller),
      ],
    );
  }

  Future<void> _addPatient(BuildContext context) async {
    final outcome = await showPatientFormDialog(context);
    if (outcome != null) controller.addPatient(outcome.patient);
  }
}
