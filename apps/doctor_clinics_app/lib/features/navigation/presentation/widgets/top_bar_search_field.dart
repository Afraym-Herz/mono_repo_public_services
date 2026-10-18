import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/navigation/presentation/widgets/top_bar_search_input.dart';
import 'package:doctor_clinics_app/features/navigation/presentation/widgets/top_bar_shortcut_hint.dart';

/// Global patient search pill shown in the workspace [TopBar].
///
/// Visual only for now: tappable/typeable, but no query is wired up yet, so it
/// holds no controller and needs no debounce. Built as a dedicated header
/// control (compact pill with a primary-colored outline and an inline keyboard
/// hint) rather than the labelled form-field kit ([AppTextField]).
///
/// TODO(search): when a query is wired up it must follow the repo standard —
/// a 500ms debounce plus an `isSearching` flag (see [AppTextField] for the
/// internal-`BlocProvider` cubit pattern) rather than filtering per keystroke.
class TopBarSearchField extends StatelessWidget {
  const TopBarSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.CONTROL_HEIGHT.h,
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicAccent),
      ),
      child: Row(
        children: [
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Icon(
            Icons.search_rounded,
            size: Dimensions.ICON_SIZE_SMALL.r,
            color: context.clinicTextSecondary,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          const Expanded(child: TopBarSearchInput()),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          const TopBarShortcutHint(),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        ],
      ),
    );
  }
}
