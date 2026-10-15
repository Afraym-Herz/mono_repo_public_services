import 'package:flutter/material.dart';

/// Shared field values forwarded from `AppTextField` to its internal parts
/// (`AppTextFieldCore`, `PasswordVisibilityProvider`).
class TextFieldParams {
  const TextFieldParams({
    required this.controller, required this.label, required this.hint,
    required this.prefixIcon, required this.suffixIcon,
    required this.keyboardType, required this.obscureText,
    required this.validator, required this.textInputAction,
    required this.onEditingComplete, required this.onFieldSubmitted,
    required this.enabled, required this.readOnly, required this.onTap,
    required this.autofocus, required this.maxLines,
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
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autofocus;
  final int maxLines;
}
