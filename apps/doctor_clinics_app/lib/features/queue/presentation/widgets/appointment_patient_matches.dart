import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_patient_option.dart';

/// Floating match card of the picker search.
///
/// Only lists patients matching the typed query — never the whole register —
/// and a tap hands the patient back to the picker to select.
class AppointmentPatientMatches extends StatelessWidget {
  const AppointmentPatientMatches({
    super.key,
    required this.controller,
    required this.patients,
    required this.query,
    required this.onPick,
  });

  final AppointmentBookingController controller;
  final List<Patient> patients;
  final String query;
  final ValueChanged<Patient> onPick;

  static bool matches(Patient patient, String query) =>
      patient.fullName.toLowerCase().contains(query) ||
      patient.fileNumber.toLowerCase().contains(query) ||
      (patient.phone ?? '').contains(query);

  @override
  Widget build(BuildContext context) {
    final filtered = patients
        .where((patient) => matches(patient, query))
        .toList(growable: false);
    return Material(
      color: context.clinicIsDark ? context.clinicContainer : context.cardColor,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
        side: BorderSide(color: context.clinicBorder),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 240.h),
        child: filtered.isEmpty
            ? Padding(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
                child: Text('appointment_sheet.no_patients'.tr()),
              )
            : ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL.r),
                itemCount: filtered.length,
                separatorBuilder: (_, _) =>
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                itemBuilder: (context, index) {
                  final patient = filtered[index];
                  return AppointmentPatientOption(
                    patient: patient,
                    isSelected: controller.selected.value?.id == patient.id,
                    onTap: () => onPick(patient),
                  );
                },
              ),
      ),
    );
  }
}
