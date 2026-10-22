import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_status_style.dart';
import 'appointment_identity.dart';
import 'appointment_queue_number.dart';
import 'appointment_row_menu.dart';
import 'appointment_status_chip.dart';
import 'appointment_type_chip.dart';

/// One scheduled patient: ticket number, identity, status and secretary actions.
class AppointmentRow extends StatelessWidget {
  const AppointmentRow({
    super.key,
    required this.item,
    required this.canManage,
    this.onTap,
  });

  final AppointmentListItem item;
  final bool canManage;

  /// Opens the patient profile; the row actions keep their own taps.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final style = AppointmentStatusStyle.forStatus(context, item.status);
    final number = item.queueNumber == null
        ? '—'
        : DateConverter.withLocalizedDigits('${item.queueNumber}', locale);
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
      child: Material(
        color: context.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          side: BorderSide(color: context.clinicBorder),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
            child: Row(
              children: [
                AppointmentQueueNumber(number: number),
                SizedBox(width: Dimensions.paddingSizeDefault.w),
                Expanded(child: AppointmentIdentity(item: item)),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                if (!context.isMobileOrSmallTablet) ...[
                  AppointmentTypeChip(type: item.type),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                ],
                AppointmentStatusChip(style: style),
                if (canManage && item.isBooked) AppointmentRowMenu(item: item),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
