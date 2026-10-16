import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';

/// Username input with its DESIGN label.
class LoginUsernameField extends StatelessWidget {
  const LoginUsernameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginFieldLabel('login_username_label'.tr()),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        AppTextField(
          controller: controller,
          hint: 'login_username_hint'.tr(),
          prefixIcon: Icons.person_outline,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: AppValidators.compose([
            AppValidators.required,
            AppValidators.minLength(4),
          ]),
        ),
      ],
    );
  }
}
