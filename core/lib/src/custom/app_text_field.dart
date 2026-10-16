import 'package:flutter/material.dart';

import 'app_text_field_core.dart';
import 'app_text_field_params.dart';
import 'password_visibility_provider.dart';

/// Premium, focus-aware text field (theme-aware, no `setState()`).
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
    this.autofillHints,
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
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autofocus;
  final int maxLines;
  final Iterable<String>? autofillHints;

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
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  TextFieldParams get _params => TextFieldParams(
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
    enabled: widget.enabled,
    readOnly: widget.readOnly,
    onTap: widget.onTap,
    autofocus: widget.autofocus,
    maxLines: widget.maxLines,
    autofillHints: widget.autofillHints,
  );

  @override
  Widget build(BuildContext context) {
    if (widget.obscureText && widget.suffixIcon == null) {
      return PasswordVisibilityProvider(params: _params, focusNode: _focusNode);
    }
    return AppTextFieldCore(
      params: _params,
      focusNode: _focusNode,
      suffixIcon: widget.suffixIcon,
      obscureText: widget.obscureText,
    );
  }
}
