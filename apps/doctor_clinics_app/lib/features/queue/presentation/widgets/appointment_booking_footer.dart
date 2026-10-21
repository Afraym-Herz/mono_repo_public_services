import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';

class AppointmentBookingFooter extends StatelessWidget {
  const AppointmentBookingFooter({
    super.key,
    required this.controller,
    required this.onConfirm,
    required this.onCancel,
  });

  final AppointmentBookingController controller;
  final ValueChanged<Patient> onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Patient?>(
      valueListenable: controller.selected,
      builder: (context, patient, _) => Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'appointment_sheet.cancel'.tr(),
              outlined: true,
              height: Dimensions.CONTROL_HEIGHT.h,
              onPressed: onCancel,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            flex: 2,
            child: AppButton(
              label: controller.isWalkIn
                  ? 'appointment_sheet.walk_in_confirm'.tr()
                  : 'appointment_sheet.confirm'.tr(),
              icon: Icons.event_available_rounded,
              height: Dimensions.CONTROL_HEIGHT.h,
              onPressed: patient == null ? null : () => onConfirm(patient),
            ),
          ),
        ],
      ),
    );
  }
}
