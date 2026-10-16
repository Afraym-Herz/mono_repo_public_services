import 'package:core/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_field_decoration.dart';
import 'app_text_field_params.dart';

/// Internal core renderer for `AppTextField` (see `app_text_field.dart`).
class AppTextFieldCore extends StatelessWidget {
  const AppTextFieldCore({
    super.key,
    required this.params,
    required this.focusNode,
    required this.suffixIcon,
    required this.obscureText,
  });

  final TextFieldParams params;
  final FocusNode focusNode;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, _) {
        final theme = Theme.of(context);
        final scheme = theme.colorScheme;
        final isDark = theme.brightness == Brightness.dark;
        final isFocused = focusNode.hasFocus;
        final primary = theme.primaryColor;
        final radius = BorderRadius.circular(14.r);
        final fillColor = isDark
            ? scheme.surfaceContainerHighest
            : AppColors.white;
        final borderColor = isDark
            ? scheme.outline.withValues(alpha: 0.35)
            : AppColors.borderPrimary;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: radius,
            boxShadow: buildTextFieldFocusShadow(
              isDark: isDark,
              isFocused: isFocused,
              primary: primary,
            ),
          ),
          child: TextFormField(
            controller: params.controller,
            focusNode: focusNode,
            keyboardType: params.keyboardType,
            obscureText: obscureText,
            validator: params.validator,
            textInputAction: params.textInputAction,
            onEditingComplete: params.onEditingComplete,
            onFieldSubmitted: params.onFieldSubmitted,
            enabled: params.enabled,
            readOnly: params.readOnly,
            onTap: params.onTap,
            autofocus: params.autofocus,
            maxLines: params.maxLines,
            autofillHints: params.autofillHints,
            style: TextStyle(
              fontSize: 14.sp,
              color: scheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
            decoration: buildAppTextFieldDecoration(
              label: params.label,
              hint: params.hint,
              prefixIcon: params.prefixIcon,
              iconColor: isFocused ? primary : theme.hintColor,
              suffixIcon: suffixIcon,
              fillColor: fillColor,
              enabled: params.enabled,
              enabledBorderColor: borderColor,
              primary: primary,
              errorColor: scheme.error,
              radius: radius,
            ),
          ),
        );
      },
    );
  }
}
