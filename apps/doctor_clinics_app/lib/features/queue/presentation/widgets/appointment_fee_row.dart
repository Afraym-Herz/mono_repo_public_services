import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';

/// Shows the template's consultation fee for the booking. The amount is
/// collected from the queue later, so this row is informational only.
class AppointmentFeeRow extends StatelessWidget {
  const AppointmentFeeRow({super.key, required this.template});

  final Future<ClinicTemplate?> template;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClinicTemplate?>(
      future: template,
      builder: (context, snapshot) {
        final fee = snapshot.data?.defaultConsultationFeePiasters ?? 0;
        if (fee <= 0) return const SizedBox.shrink();
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            vertical: Dimensions.PADDING_SIZE_SMALL.h,
          ),
          decoration: BoxDecoration(
            color: context.clinicContainer,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
            border: Border.all(color: context.clinicBorder),
          ),
          child: Row(
            children: [
              Icon(
                Icons.payments_outlined,
                size: Dimensions.ICON_SIZE_SMALL.r,
                color: context.clinicPrimary,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(
                child: Text(
                  'appointment_sheet.fee'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.clinicTextSecondary,
                  ),
                ),
              ),
              Text(
                _money(fee, context),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: context.clinicPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _money(int piasters, BuildContext context) {
    final value = (piasters / 100).toStringAsFixed(2);
    final trimmed = value.endsWith('.00')
        ? value.substring(0, value.length - 3)
        : value;
    final digits = DateConverter.withLocalizedDigits(
      trimmed,
      context.locale.toString(),
    );
    return '$digits ${'patients.currency'.tr()}';
  }
}
