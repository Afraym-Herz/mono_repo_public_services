import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/invoice_form_controller.dart';
import 'new_invoice_patient_suggestions.dart';

/// Search field of the invoice patient step.
///
/// Matches float in an [OverlayPortal] anchored under the field — never an
/// inline panel — and the dropdown exists only while the text is searchable.
class NewInvoicePatientSearchField extends StatefulWidget {
  const NewInvoicePatientSearchField({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  State<NewInvoicePatientSearchField> createState() =>
      _NewInvoicePatientSearchFieldState();
}

class _NewInvoicePatientSearchFieldState
    extends State<NewInvoicePatientSearchField> {
  final OverlayPortalController _dropdown = OverlayPortalController();
  final LayerLink _link = LayerLink();

  @override
  void initState() {
    super.initState();
    widget.controller.patientSearch.addListener(_sync);
  }

  @override
  void dispose() {
    widget.controller.patientSearch.removeListener(_sync);
    super.dispose();
  }

  void _sync() {
    final controller = widget.controller;
    final text = controller.patientSearch.text.trim();
    final chosen = controller.patient.value;
    if (chosen != null && chosen.fullName != text) {
      controller.patient.value = null;
    }
    if (text.isEmpty || controller.patient.value != null) {
      _hide();
    } else if (!_dropdown.isShowing) {
      _dropdown.show();
    }
  }

  void _hide() {
    if (_dropdown.isShowing) _dropdown.hide();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OverlayPortal(
        controller: _dropdown,
        overlayChildBuilder: (context) => NewInvoicePatientSuggestions(
          controller: widget.controller,
          link: _link,
          width: constraints.maxWidth,
          onDismiss: _hide,
        ),
        child: CompositedTransformTarget(
          link: _link,
          child: AppTextField(
            controller: widget.controller.patientSearch,
            hint: 'billing.invoice_form.patient_hint'.tr(),
            prefixIcon: Icons.search_rounded,
            onTap: _sync,
          ),
        ),
      ),
    );
  }
}
