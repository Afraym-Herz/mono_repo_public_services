import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';

/// First-run password input: DESIGN label + min-length validation.
///
/// NOTE: no `newPassword` autofill hint here on purpose. Chrome attaches its
/// password-generation UI to `newPassword` fields inside an AutofillGroup and
/// swallows keystrokes, leaving the Flutter field dead. This is a local offline
/// account, so browser password generation has no value anyway.
class FirstRunPasswordField extends StatelessWidget {
  const FirstRunPasswordField({super.key, required this.controller});

  /// Controller owned by the parent setup panel.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginFieldLabel('login_password_label'.tr()),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        AppTextField(
          controller: controller,
          hint: '••••••••••••',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
          textInputAction: TextInputAction.next,
          validator: AppValidators.compose([
            AppValidators.required,
            AppValidators.minLength(6),
          ]),
        ),
      ],
    );
  }
}
