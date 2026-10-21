import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_status_style.dart';
import 'appointment_identity.dart';
import 'appointment_queue_number.dart';
import 'appointment_row_actions.dart';
import 'appointment_status_chip.dart';
import 'appointment_type_chip.dart';

/// One scheduled patient: ticket number, identity, status and secretary actions.
class AppointmentRow extends StatelessWidget {
  const AppointmentRow({
    super.key,
    required this.item,
    required this.canManage,
  });

  final AppointmentListItem item;
  final bool canManage;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final style = AppointmentStatusStyle.forStatus(item.status);
    final number = item.queueNumber == null
        ? '—'
        : DateConverter.withLocalizedDigits('${item.queueNumber}', locale);
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
      padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: AppColors.clinicBorder),
      ),
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
          if (canManage && item.isBooked) _Menu(item: item),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({required this.item});

  final AppointmentListItem item;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded),
      onSelected: (value) => value == 'reschedule'
          ? AppointmentRowActions.reschedule(context, item)
          : AppointmentRowActions.cancel(context, item),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 'reschedule',
          child: Text('appointment_row.reschedule'.tr()),
        ),
        PopupMenuItem(
          value: 'cancel',
          child: Text('appointment_row.cancel'.tr()),
        ),
      ],
    );
  }
}
