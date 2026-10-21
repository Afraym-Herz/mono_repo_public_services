import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';
import 'appointment_booking_footer.dart';
import 'appointment_date_picker_row.dart';
import 'appointment_fee_row.dart';
import 'appointment_patient_picker.dart';
import 'appointment_type_field.dart';

class AppointmentBookingForm extends StatelessWidget {
  const AppointmentBookingForm({
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
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        0,
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_LARGE.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppointmentPatientPicker(controller: controller),
          if (!controller.isWalkIn) ...[
            gap,
            AppointmentTypeField(type: controller.type),
            gap,
            AppointmentDatePickerRow(date: controller.date),
            gap,
            AppTextField(
              controller: controller.reason,
              label: 'appointment_sheet.reason'.tr(),
              hint: 'appointment_sheet.reason_hint'.tr(),
              maxLines: 2,
            ),
          ],
          gap,
          AppTextField(
            controller: controller.notes,
            label: 'appointment_sheet.notes'.tr(),
            hint: 'appointment_sheet.notes_hint'.tr(),
            maxLines: 3,
          ),
          if (!controller.isWalkIn) ...[
            gap,
            AppointmentFeeRow(template: controller.template),
          ],
          SizedBox(height: Dimensions.paddingSizeDefault.h),
          AppointmentBookingFooter(
            controller: controller,
            onConfirm: onConfirm,
            onCancel: onCancel,
          ),
        ],
      ),
    );
  }
}
