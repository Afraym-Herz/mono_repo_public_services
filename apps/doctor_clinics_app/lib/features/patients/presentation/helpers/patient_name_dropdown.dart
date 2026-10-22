import 'package:flutter/widgets.dart';

import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_name_matches_cubit.dart';

/// Owns the floating dropdown of the new-patient name field: its portal, its
/// anchor and the show/hide rules that follow the duplicate check.
class PatientNameDropdown {
  final OverlayPortalController portal = OverlayPortalController();
  final LayerLink link = LayerLink();

  void setOpen(bool open) {
    if (open && !portal.isShowing) portal.show();
    if (!open && portal.isShowing) portal.hide();
  }

  /// Opens when fresh matches arrive and closes when there are none, keeping
  /// the card as-is while the debounce runs.
  void sync(PatientNameMatchesState state) {
    final matches = state.maybeMap(
      success: (success) => success.matches,
      orElse: () => null,
    );
    if (state.maybeMap(initial: (_) => true, orElse: () => false)) {
      setOpen(false);
    } else if (matches != null) {
      setOpen(matches.isNotEmpty);
    }
  }
}
