import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/patient_toolbar_cubit.dart';
import 'patient_search_overlay.dart';
import 'patient_search_pill.dart';

/// Patient search pill plus the floating suggestion dropdown it owns.
///
/// The dropdown renders through [OverlayPortal] on the app's overlay, so it
/// floats above the table instead of pushing it down. It opens only once a
/// debounced query exists — an empty field keeps it hidden — and dismisses on
/// any outside tap.
class PatientSearchField extends StatelessWidget {
  const PatientSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientToolbarCubit>();
    return LayoutBuilder(
      builder: (context, constraints) => OverlayPortal(
        controller: cubit.suggestions,
        overlayChildBuilder: (context) => PatientSearchOverlay(
          width: constraints.maxWidth,
          link: cubit.suggestionsLink,
        ),
        child: CompositedTransformTarget(
          link: cubit.suggestionsLink,
          child: const PatientSearchPill(),
        ),
      ),
    );
  }
}
