import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_form_dialog.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_patient_list.dart';

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
        AppTextField(
          controller: controller.search,
          hint: 'appointment_sheet.search_hint'.tr(),
          prefixIcon: Icons.search_rounded,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        SizedBox(
          height: 220.h,
          child: ValueListenableBuilder<int>(
            valueListenable: controller.patientsRevision,
            builder: (context, _, _) =>
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller.search,
                  builder: (context, value, _) => FutureBuilder<List<Patient>>(
                    future: controller.patients,
                    builder: (context, snapshot) => AppointmentPatientList(
                      controller: controller,
                      snapshot: snapshot,
                      query: value.text.trim().toLowerCase(),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }

  Future<void> _addPatient(BuildContext context) async {
    final patient = await showPatientFormDialog(context);
    if (patient == null) return;
    controller.search.clear();
    controller.addPatient(patient);
  }
}
