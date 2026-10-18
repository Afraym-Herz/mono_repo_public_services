import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/widgets/top_bar_search_field.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/top_bar_user_profile.dart';

/// Persistent workspace top bar shared by every shell tab.
///
/// Hosts the global patient search (leading edge) and the signed-in user block
/// (trailing edge). Language and theme controls deliberately live in the
/// quick-settings modal — not here — so they exist in exactly one place.
///
/// Rendered once by [AppShellLayout] so no individual screen repeats it.
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(bottom: BorderSide(color: context.clinicBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 560.w),
                child: const TopBarSearchField(),
              ),
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
          Container(
            width: 1,
            height: Dimensions.CONTROL_HEIGHT.h,
            color: context.clinicBorder,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
          const TopBarUserProfile(),
        ],
      ),
    );
  }
}
