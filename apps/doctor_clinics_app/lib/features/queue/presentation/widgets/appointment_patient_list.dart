import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patient_profile_dialog.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_patient_option.dart';

class AppointmentPatientList extends StatelessWidget {
  const AppointmentPatientList({
    super.key,
    required this.controller,
    required this.snapshot,
    required this.query,
  });

  final AppointmentBookingController controller;
  final AsyncSnapshot<List<Patient>> snapshot;
  final String query;

  @override
  Widget build(BuildContext context) {
    final cached = controller.lastPatients;
    if (snapshot.connectionState != ConnectionState.done && cached == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final all = snapshot.data ?? cached ?? const <Patient>[];
    final filtered = query.isEmpty
        ? all
        : all.where((p) => _matches(p, query)).toList();
    if (filtered.isEmpty) {
      return Center(child: Text('appointment_sheet.no_patients'.tr()));
    }
    return ValueListenableBuilder<Patient?>(
      valueListenable: controller.selected,
      builder: (context, chosen, _) => ListView.separated(
        itemCount: filtered.length,
        separatorBuilder: (_, _) =>
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        itemBuilder: (context, index) {
          final patient = filtered[index];
          return AppointmentPatientOption(
            patient: patient,
            isSelected: chosen?.id == patient.id,
            onTap: () => _onPatientTap(context, patient),
          );
        },
      ),
    );
  }

  void _onPatientTap(BuildContext context, Patient patient) async {
    await showPatientDetailDialog(context, patient: patient);
    // No 'mounted' check needed - this is a StatelessWidget method.
    // The dialog dismisses automatically; if re-selection is desired,
    // the caller can handle it.
    controller.search.clear();
  }

  bool _matches(Patient patient, String query) =>
      patient.fullName.toLowerCase().contains(query) ||
      patient.fileNumber.toLowerCase().contains(query) ||
      (patient.phone ?? '').contains(query);
}