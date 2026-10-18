import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Transparent text input for [TopBarSearchField].
///
/// The pill's outer `Container` owns the fill and the primary border, so every
/// input border is stripped here — the theme otherwise installs a rounded
/// `OutlineInputBorder` + fill on every field (core `color_schemes.dart`).
class TopBarSearchInput extends StatelessWidget {
  const TopBarSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      cursorColor: context.clinicAccent,
      style: TextStyle(
        fontSize: Dimensions.FONT_SIZE_SMALL.sp,
        color: context.clinicTextPrimary,
      ),
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
    );
  }
}
