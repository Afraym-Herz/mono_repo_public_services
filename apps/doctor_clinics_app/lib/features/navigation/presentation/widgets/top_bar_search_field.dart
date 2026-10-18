import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Global patient search shown in the workspace [TopBar].
///
/// Visual only for now: the field is tappable/typeable but no query is wired
/// up yet. Built as a dedicated header control (compact pill with a
/// primary-colored outline and an inline keyboard hint) rather than the
/// labelled form-field kit ([AppTextField]).
class TopBarSearchField extends StatefulWidget {
  const TopBarSearchField({super.key});

  @override
  State<TopBarSearchField> createState() => _TopBarSearchFieldState();
}

class _TopBarSearchFieldState extends State<TopBarSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    return Container(
      height: Dimensions.CONTROL_HEIGHT.h,
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: radius,
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
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              cursorColor: context.clinicAccent,
              style: TextStyle(
                fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                color: context.clinicTextPrimary,
              ),
              // The theme installs a rounded OutlineInputBorder + fill on every
              // field (see core `color_schemes.dart`). Strip all of it here so
              // the TextField is transparent and only the outer Container
              // provides the fill and primary border.
              decoration: InputDecoration(
                isDense: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: 'top_bar_search_hint'.tr(),
                hintStyle: TextStyle(
                  fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                  color: context.clinicTextSecondary,
                ),
              ),
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          const _TopBarShortcutHint(),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        ],
      ),
    );
  }
}

/// Plain `Ctrl+K` text affordance hinting the (future) search shortcut.
class _TopBarShortcutHint extends StatelessWidget {
  const _TopBarShortcutHint();

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      'top_bar_search_shortcut'.tr(),
      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
      responsive: false,
      color: context.clinicTextSecondary,
    );
  }
}
