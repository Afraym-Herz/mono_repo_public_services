import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_form_dialog.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_patient_search_field.dart';

/// Patient step of the booking sheet.
///
/// Matches float in a dropdown under the field (see
/// [AppointmentPatientSearchField]) instead of an inline result panel, so the
/// step is only as tall as its field and nothing is listed while it is empty.
class AppointmentPatientPicker extends StatelessWidget {
  const AppointmentPatientPicker({super.key, required this.controller});

  final AppointmentBookingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'appointment_sheet.patient'.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: context.clinicTextSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () => _addPatient(context),
              icon: const Icon(Icons.person_add_alt_1_outlined, size: 18),
              label: Text('appointment_sheet.new_patient'.tr()),
            ),
          ],
        ),
        AppointmentPatientSearchField(controller: controller),
      ],
    );
  }

  Future<void> _addPatient(BuildContext context) async {
    final outcome = await showPatientFormDialog(context);
    if (outcome != null) controller.addPatient(outcome.patient);
  }
}
