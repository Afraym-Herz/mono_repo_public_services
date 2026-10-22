import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_patient_matches.dart';

/// Overlay content of the picker search: a tap-anywhere barrier plus the
/// floating match card anchored under the field.
class AppointmentPatientSuggestions extends StatelessWidget {
  const AppointmentPatientSuggestions({
    super.key,
    required this.controller,
    required this.link,
    required this.width,
    required this.onPick,
    required this.onDismiss,
  });

  final AppointmentBookingController controller;
  final LayerLink link;
  final double width;
  final ValueChanged<Patient> onPick;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Patient>>(
      future: controller.patients,
      builder: (context, snapshot) {
        final patients = snapshot.data ?? controller.lastPatients;
        return SizedBox.expand(
          child: Stack(
            children: [
              if (patients != null)
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onDismiss,
                  ),
                ),
              CompositedTransformFollower(
                link: link,
                targetAnchor: Alignment.bottomLeft,
                followerAnchor: Alignment.topLeft,
                offset: Offset(0, Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                child: SizedBox(
                  width: width,
                  child: patients == null
                      ? const SizedBox.shrink()
                      : ValueListenableBuilder<TextEditingValue>(
                          valueListenable: controller.search,
                          builder: (context, value, _) =>
                              AppointmentPatientMatches(
                                controller: controller,
                                patients: patients,
                                query: value.text.trim().toLowerCase(),
                                onPick: onPick,
                              ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
