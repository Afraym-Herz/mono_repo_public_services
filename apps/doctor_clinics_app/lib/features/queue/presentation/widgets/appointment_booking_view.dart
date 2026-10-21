import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_booking_form.dart';
import 'appointment_booking_header.dart';

class AppointmentBookingView extends StatelessWidget {
  const AppointmentBookingView({
    super.key,
    required this.controller,
    required this.onClose,
    required this.onConfirm,
  });
  final AppointmentBookingController controller;
  final VoidCallback onClose;
  final ValueChanged<Patient> onConfirm;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_LARGE.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 560.w,
          maxHeight: MediaQuery.sizeOf(context).height * 0.86,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppointmentBookingHeader(
              isWalkIn: controller.isWalkIn,
              onClose: onClose,
            ),
            Flexible(
              child: AppointmentBookingForm(
                controller: controller,
                onConfirm: onConfirm,
                onCancel: onClose,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
