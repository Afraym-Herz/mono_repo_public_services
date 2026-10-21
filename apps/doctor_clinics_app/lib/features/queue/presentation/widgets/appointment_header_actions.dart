import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Header actions for the appointment planner: print schedule + book new.
///
/// The outlined print action leads and the filled "book" trails, so the primary
/// action lands on the leading edge in RTL. [Wrap] keeps them from overflowing.
class AppointmentHeaderActions extends StatelessWidget {
  const AppointmentHeaderActions({super.key, this.onBook, this.onPrint});

  /// Opens the booking sheet.
  final VoidCallback? onBook;

  /// Prints the visible schedule.
  final VoidCallback? onPrint;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      children: [
        AppPillButton(
          icon: Icons.print_outlined,
          label: 'appointment_header.print'.tr(),
          onTap: onPrint ?? () {},
          outlined: true,
          iconTrailing: true,
        ),
        AppPillButton(
          icon: Icons.add_circle_outline_rounded,
          label: 'appointment_header.book'.tr(),
          onTap: onBook ?? () {},
          primary: true,
          iconTrailing: true,
        ),
      ],
    );
  }
}
