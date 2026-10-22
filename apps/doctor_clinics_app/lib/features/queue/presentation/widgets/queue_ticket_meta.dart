import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Meta line on a queue card.
///
/// Reuses the home "current queue" row language: a small type chip (booked /
/// walk-in / follow-up) followed by a dot and the wait-time detail for live
/// patients. Day-only bookings never show a time slot.
class QueueTicketMeta extends StatelessWidget {
  const QueueTicketMeta({super.key, this.appointmentType, this.detail});

  /// Raw appointment type code (`booked`, `walk_in`, `follow_up`).
  final String? appointmentType;

  /// Pre-formatted timing detail (`وقت الانتظار: ١٨ دقيقة`).
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: context.clinicTextSecondary,
      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL.sp,
    );
    final hasType = appointmentType != null && appointmentType!.isNotEmpty;
    final hasDetail = detail != null && detail!.isNotEmpty;
    if (!hasType && !hasDetail) return const SizedBox.shrink();

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      children: [
        if (hasType)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_BORDER.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicInset,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
            ),
            child: Text(
              _localizeType(appointmentType!),
              style: style?.copyWith(color: context.clinicAccent),
            ),
          ),
        if (hasType && hasDetail) Text('•', style: style),
        if (hasDetail) Text(detail!, style: style),
      ],
    );
  }

  String _localizeType(String type) {
    switch (type) {
      case AppConstants.appointmentTypeBooked:
        return 'queue_row.type.booked'.tr();
      case AppConstants.appointmentTypeWalkIn:
        return 'queue_row.type.walk_in'.tr();
      case AppConstants.appointmentTypeFollowUp:
        return 'queue_row.type.follow_up'.tr();
      default:
        return type;
    }
  }
}
