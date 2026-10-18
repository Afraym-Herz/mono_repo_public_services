import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// The home header's two quick actions: book an appointment / add a patient to
/// the queue. Both jump into the matching workspace tab.
class HomeGreetingActions extends StatelessWidget {
  const HomeGreetingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppPillButton(
          icon: Icons.calendar_month_outlined,
          label: 'home_action_book_appointment'.tr(),
          onTap: () => context.go(Routes.appointments),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        AppPillButton(
          icon: Icons.person_add_alt_1_outlined,
          label: 'home_action_add_to_queue'.tr(),
          onTap: () => context.go(Routes.queue),
          primary: true,
        ),
      ],
    );
  }
}
