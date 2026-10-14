import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agreements/core/theme/app_colors.dart';

/// A branded, theme-aware dropdown field used throughout the app.
///
/// Matches [AppTextField] styling exactly:
/// - Same fill, border radius, padding and label style.
/// - Prefix icon tints to primary colour.
/// - Supports validation and disabled state.
///
/// Usage:
/// ```dart
/// AppDropdownField<int>(
///   label: 'Currency'.tr(),
///   prefixIcon: Icons.attach_money,
///   value: selectedCurrencyId,
///   items: currencies.map((c) =>
///     DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
///   onChanged: (id) => setState(() => selectedCurrencyId = id),
/// )
/// ```
class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.prefixIcon,
    this.hint,
    this.validator,
    this.enabled = true,
  });

  final String label;
  final String? hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final IconData? prefixIcon;
  final FormFieldValidator<T>? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final primary = Theme.of(context).primaryColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final fillColor = isDark ? const Color(0xFF2A2D3E) : AppColors.white;

    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(
        color: isDark ? const Color(0xFF3D4160) : AppColors.borderPrimary,
        width: 1,
      ),
    );

    return DropdownButtonFormField<T>(
      initialValue: value,
      validator: validator,
      onChanged: enabled ? onChanged : null,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: enabled
            ? scheme.onSurface.withValues(alpha: 0.5)
            : scheme.onSurface.withValues(alpha: 0.25),
        size: 20.r,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: enabled ? fillColor : fillColor.withValues(alpha: 0.5),
        labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.textTertiary),
        hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.textTertiary),
        floatingLabelStyle: TextStyle(
          fontSize: 13.sp,
          color: primary,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20.r, color: primary)
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        border: enabledBorder,
        enabledBorder: enabledBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: scheme.error, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: isDark
                ? const Color(0xFF3D4160)
                : AppColors.borderPrimary.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      dropdownColor: isDark ? const Color(0xFF2A2D3E) : AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      items: items,
    );
  }
}
