import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/patient_name_matches_cubit.dart';
import '../helpers/patient_form_controller.dart';
import '../helpers/patient_name_dropdown.dart';
import 'patient_form_name_matches.dart';

/// Name field of the new-patient form: registered names float in a dropdown
/// under it while the secretary types — the form's duplicate guard.
class PatientFormNameField extends StatefulWidget {
  const PatientFormNameField({super.key, required this.controller});

  final PatientFormController controller;

  @override
  State<PatientFormNameField> createState() => _PatientFormNameFieldState();
}

class _PatientFormNameFieldState extends State<PatientFormNameField> {
  final PatientNameDropdown _dropdown = PatientNameDropdown();

  @override
  void initState() {
    super.initState();
    widget.controller.name.addListener(_notify);
  }

  @override
  void dispose() {
    widget.controller.name.removeListener(_notify);
    super.dispose();
  }

  void _notify() => context.read<PatientNameMatchesCubit>().queryChanged(
    widget.controller.name.text,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientNameMatchesCubit, PatientNameMatchesState>(
      listener: (context, state) => _dropdown.sync(state),
      child: LayoutBuilder(
        builder: (context, constraints) => OverlayPortal(
          controller: _dropdown.portal,
          overlayChildBuilder: (context) => PatientFormNameMatches(
            width: constraints.maxWidth,
            link: _dropdown.link,
            onDismiss: () => _dropdown.setOpen(false),
          ),
          child: CompositedTransformTarget(
            link: _dropdown.link,
            child: AppTextField(
              controller: widget.controller.name,
              label: 'patient_form.name'.tr(),
              hint: 'patient_form.name_hint'.tr(),
              prefixIcon: Icons.person_outline_rounded,
              validator: AppValidators.required,
              textInputAction: TextInputAction.next,
              autofocus: true,
            ),
          ),
        ),
      ),
    );
  }
}
