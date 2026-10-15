import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_dropdown_decoration.dart';

/// Branded, theme-aware dropdown field matching [AppTextField] styling.
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
    final fillColor = isDark ? AppColors.inputFillDark : AppColors.white;

    return DropdownButtonFormField<T>(
      initialValue: value,
      validator: validator,
      onChanged: enabled ? onChanged : null,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: scheme.onSurface.withValues(alpha: enabled ? 0.5 : 0.25),
        size: Dimensions.NAVBAR_ICON_SIZE.r,
      ),
      decoration: buildAppDropdownDecoration(
        label: label,
        hint: hint,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        enabled: enabled,
        enabledBorder: _enabledBorder(isDark),
        primary: primary,
        scheme: scheme,
        isDark: isDark,
      ),
      dropdownColor: isDark ? AppColors.inputFillDark : AppColors.white,
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      items: items,
    );
  }

  OutlineInputBorder _enabledBorder(bool isDark) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      borderSide: BorderSide(
        color: isDark ? AppColors.borderDark : AppColors.borderPrimary,
        width: 1,
      ),
    );
  }
}
