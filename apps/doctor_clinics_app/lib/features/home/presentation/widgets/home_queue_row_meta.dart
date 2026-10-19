import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Meta line under a queue row name: exam type followed by the wait time (or the
/// confirmed slot for booked patients), separated by a dot.
class HomeQueueRowMeta extends StatelessWidget {
  const HomeQueueRowMeta({
    super.key,
    required this.examTypeKey,
    this.waitMinutes,
    this.appointmentTime,
  });

  /// `.tr()` key for the exam/visit type.
  final String examTypeKey;

  /// Minutes waiting, for arrived patients.
  final int? waitMinutes;

  /// Confirmed slot, for booked patients.
  final String? appointmentTime;

  @override
  Widget build(BuildContext context) {
    final detail = waitMinutes != null
        ? 'home_queue_wait'.tr(
            namedArgs: {
              'minutes': DateConverter.withLocalizedDigits(
                '$waitMinutes',
                context.locale.toString(),
              ),
            },
          )
        : 'home_queue_appointment'.tr(
            namedArgs: {'time': appointmentTime ?? ''},
          );

    return Row(
      children: [
        Flexible(
          child: ResponsiveText(
            'home_queue_exam_type'.tr(namedArgs: {'type': examTypeKey.tr()}),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w / 2,
          ),
          child: ResponsiveText(
            '•',
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
          ),
        ),
        Flexible(
          child: ResponsiveText(
            detail,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
