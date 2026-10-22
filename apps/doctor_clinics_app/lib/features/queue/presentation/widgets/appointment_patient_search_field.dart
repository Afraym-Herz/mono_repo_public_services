import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_patient_suggestions.dart';

/// Search field of the booking sheet's patient step.
///
/// Matches float in an [OverlayPortal] anchored under the field — never an
/// inline panel — and the dropdown exists only while the text is searchable.
class AppointmentPatientSearchField extends StatefulWidget {
  const AppointmentPatientSearchField({super.key, required this.controller});

  final AppointmentBookingController controller;

  @override
  State<AppointmentPatientSearchField> createState() =>
      _AppointmentPatientSearchFieldState();
}

class _AppointmentPatientSearchFieldState
    extends State<AppointmentPatientSearchField> {
  final OverlayPortalController _dropdown = OverlayPortalController();
  final LayerLink _link = LayerLink();

  @override
  void initState() {
    super.initState();
    widget.controller.search.addListener(_sync);
  }

  @override
  void dispose() {
    widget.controller.search.removeListener(_sync);
    super.dispose();
  }

  void _sync() {
    final text = widget.controller.search.text.trim();
    final chosen = widget.controller.selected.value;
    if (chosen != null && chosen.fullName != text) {
      widget.controller.selected.value = null;
    }
    if (text.isEmpty || widget.controller.selected.value != null) {
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
        overlayChildBuilder: (context) => AppointmentPatientSuggestions(
          controller: widget.controller,
          link: _link,
          width: constraints.maxWidth,
          onPick: widget.controller.selectPatient,
          onDismiss: _hide,
        ),
        child: CompositedTransformTarget(
          link: _link,
          child: AppTextField(
            controller: widget.controller.search,
            hint: 'appointment_sheet.search_hint'.tr(),
            prefixIcon: Icons.search_rounded,
            onTap: _sync,
          ),
        ),
      ),
    );
  }
}
