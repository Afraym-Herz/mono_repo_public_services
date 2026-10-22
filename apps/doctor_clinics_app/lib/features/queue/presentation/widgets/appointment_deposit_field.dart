import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_booking_controller.dart';

/// Optional amount the patient paid when the booking was made.
class AppointmentDepositField extends StatelessWidget {
  const AppointmentDepositField({super.key, required this.controller});

  final AppointmentBookingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller.deposit,
      label: 'appointment_sheet.deposit'.tr(),
      hint: 'appointment_sheet.deposit_hint'.tr(),
      keyboardType: TextInputType.number,
      prefixIcon: Icons.account_balance_wallet_outlined,
    );
  }
}
