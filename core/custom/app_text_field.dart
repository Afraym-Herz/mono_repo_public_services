import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agreements/core/shared_cubits/password_visibility/password_visibility_cubit.dart';
import 'package:agreements/core/shared_cubits/password_visibility/password_visibility_state.dart';
import 'package:agreements/core/theme/app_colors.dart';

/// A premium, focus-aware text field used throughout the app.
///
/// - Prefix icon tints to primary colour on focus.
/// - Subtle shadow glows on focus in light mode.
/// - Automatically provides its own independent [PasswordVisibilityCubit] when [obscureText] is true.
/// - Fully theme-aware: works in both light and dark mode with ZERO `setState()` usage.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.textInputAction,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.autofocus = false,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;

  /// Fired when the user presses Enter / the keyboard action button.
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autofocus;
  final int maxLines;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.obscureText && widget.suffixIcon == null) {
      return BlocProvider<PasswordVisibilityCubit>(
        create: (_) => PasswordVisibilityCubit(initialObscured: true),
        child: BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
          builder: (context, state) {
            final isObscured = state.isObscured;
            return _TextFieldCoreWidget(
              controller: widget.controller,
              label: widget.label,
              hint: widget.hint,
              prefixIcon: widget.prefixIcon,
              suffixIcon: IconButton(
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).hintColor,
                ),
                onPressed: () =>
                    context.read<PasswordVisibilityCubit>().toggleVisibility(),
              ),
              keyboardType: widget.keyboardType,
              obscureText: isObscured,
              validator: widget.validator,
              textInputAction: widget.textInputAction,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              focusNode: _focusNode,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              autofocus: widget.autofocus,
              maxLines: widget.maxLines,
            );
          },
        ),
      );
    }

    return _TextFieldCoreWidget(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: _focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      autofocus: widget.autofocus,
      maxLines: widget.maxLines,
    );
  }
}

class _TextFieldCoreWidget extends StatelessWidget {
  const _TextFieldCoreWidget({
    required this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.keyboardType,
    required this.obscureText,
    this.validator,
    this.textInputAction,
    this.onEditingComplete,
    this.onFieldSubmitted,
    required this.focusNode,
    required this.enabled,
    required this.readOnly,
    this.onTap,
    required this.autofocus,
    required this.maxLines,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode focusNode;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autofocus;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, _) {
        final isFocused = focusNode.hasFocus;
        final theme = Theme.of(context);
        final scheme = theme.colorScheme;
        final primary = theme.primaryColor;
        final isDark = theme.brightness == Brightness.dark;

        final fillColor = isDark
            ? scheme.surfaceContainerHighest
            : AppColors.white;

        final enabledBorderColor = isDark
            ? scheme.outline.withValues(alpha: 0.35)
            : AppColors.borderPrimary;

        final iconColor = isFocused ? primary : theme.hintColor;

        final focusShadow = (!isDark && isFocused)
            ? [
                BoxShadow(
                  color: primary.withValues(alpha: 0.18),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : <BoxShadow>[];

        final radius = BorderRadius.circular(14.r);

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: radius,
            boxShadow: focusShadow,
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            enabled: enabled,
            readOnly: readOnly,
            onTap: onTap,
            autofocus: autofocus,
            maxLines: maxLines,
            style: TextStyle(
              fontSize: 14.sp,
              color: scheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: (label != null && label!.isNotEmpty) ? label : null,
              hintText: hint,
              prefixIcon: prefixIcon != null
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Icon(prefixIcon, size: 20.r, color: iconColor),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(
                minWidth: 44.w,
                minHeight: 0,
              ),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: enabled ? fillColor : fillColor.withValues(alpha: 0.5),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              border: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: enabledBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: enabledBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: primary, width: 1.8),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: scheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(color: scheme.error, width: 1.8),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: radius,
                borderSide: BorderSide(
                  color: enabledBorderColor.withValues(alpha: 0.4),
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textTertiary,
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: TextStyle(
                fontSize: 12.sp,
                color: primary,
                fontWeight: FontWeight.w600,
              ),
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textTertiary,
              ),
              errorStyle: TextStyle(fontSize: 11.sp, color: scheme.error),
            ),
          ),
        );
      },
    );
  }
}
