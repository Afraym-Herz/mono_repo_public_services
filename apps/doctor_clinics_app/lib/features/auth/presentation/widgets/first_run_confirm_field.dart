import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';

/// First-run password confirmation: must match [passwordController]'s value.
class FirstRunConfirmField extends StatelessWidget {
  const FirstRunConfirmField({
    super.key,
    required this.controller,
    required this.passwordController,
    required this.onFieldSubmitted,
  });

  /// Controller owned by the parent setup panel.
  final TextEditingController controller;

  /// Password controller the confirmation is checked against.
  final TextEditingController passwordController;

  /// Invoked when the field is submitted from the keyboard.
  final ValueChanged<String> onFieldSubmitted;

  String? _validate(String? v) {
    if (v == null || v.isEmpty) return 'field_required'.tr();
    if (v != passwordController.text) return 'login_password_mismatch'.tr();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginFieldLabel('login_password_confirm_label'.tr()),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        AppTextField(
          controller: controller,
          hint: '••••••••••••',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onFieldSubmitted,
          validator: _validate,
        ),
      ],
    );
  }
}
