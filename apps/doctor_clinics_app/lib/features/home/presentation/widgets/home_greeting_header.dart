import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_actions.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_line.dart';

/// Dashboard greeting block docked under the workspace top bar: the signed-in
/// user's name, the device's current local date + clinic hours, and the two
/// quick actions.
///
/// The name comes from [AppAuthCubit] — the same source the top bar's user block
/// reads — while the date is formatted from `DateTime.now()`, so the header is
/// never pinned to a hard-coded day.
class HomeGreetingHeader extends StatelessWidget {
  const HomeGreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateConverter.localizedFullDate(
      DateTime.now(),
      context.locale.toString(),
    );

    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.HOME_PAGE_PADDING.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeGreetingLine(name: _signedInName(context)),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                  AppMetaRow(
                    label: date,
                    detail: 'home_clinic_hours'.tr(),
                    separator: '|',
                  ),
                ],
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
            const HomeGreetingActions(),
          ],
        ),
      ),
    );
  }
}

/// Resolves the display name from the shared auth state, mirroring the top bar's
/// user block so both chrome pieces always agree.
String _signedInName(BuildContext context) {
  final user = context.watch<AppAuthCubit>().state.maybeWhen(
    authenticated: (user) => user,
    orElse: () => null,
  );
  return user?.name.isNotEmpty == true
      ? user!.name
      : 'header.user_fallback_name'.tr();
}
