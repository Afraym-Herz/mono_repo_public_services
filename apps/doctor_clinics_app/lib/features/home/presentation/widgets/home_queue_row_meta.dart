import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Meta line under a queue row name: exam type followed by the wait time (or
/// the day-queue hint for booked patients), separated by a dot.
class HomeQueueRowMeta extends StatelessWidget {
  const HomeQueueRowMeta({
    super.key,
    required this.examTypeKey,
    this.waitMinutes,
  });

  /// `.tr()` key for the exam/visit type.
  final String examTypeKey;

  /// Minutes waiting, for live queue patients.
  final int? waitMinutes;

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
        : 'home_queue_booked'.tr();

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
