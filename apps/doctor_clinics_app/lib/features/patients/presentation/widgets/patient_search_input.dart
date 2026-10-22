import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Transparent text input for [PatientSearchField].
///
/// The outer pill owns the fill and border, so every input border is stripped
/// here — the theme otherwise installs a rounded outline + fill on every field.
class PatientSearchInput extends StatelessWidget {
  const PatientSearchInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onTap,
  });

  /// Controller owned by the toolbar cubit.
  final TextEditingController controller;

  /// Called on every keystroke; the cubit debounces it.
  final ValueChanged<String> onChanged;

  /// Called when the field is tapped, so the dropdown can re-open.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
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
        hintText: 'patients.search_hint'.tr(),
        hintStyle: TextStyle(
          fontSize: Dimensions.FONT_SIZE_SMALL.sp,
          color: context.clinicTextSecondary,
        ),
      ),
    );
  }
}
