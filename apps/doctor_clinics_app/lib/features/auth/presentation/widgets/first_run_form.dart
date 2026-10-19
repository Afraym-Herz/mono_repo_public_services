import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_confirm_field.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_header.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_password_field.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/first_run_username_field.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_submit_button.dart';

/// First-run setup form body: headline, credential fields and the submit CTA.
///
/// Composes the sub-widgets into the [Form]/[AutofillGroup] the panel owns, so
/// validation and autofill stay bound to the parent's controllers.
class FirstRunForm extends StatelessWidget {
  const FirstRunForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.confirmController,
    required this.onSubmit,
  });

  /// Form key owned by the parent, used to validate on submit.
  final GlobalKey<FormState> formKey;

  /// Username controller owned by the parent.
  final TextEditingController usernameController;

  /// Password controller owned by the parent.
  final TextEditingController passwordController;

  /// Confirmation controller owned by the parent.
  final TextEditingController confirmController;

  /// Invoked by the field submit action and the CTA.
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 200),
      child: Form(
        key: formKey,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FirstRunHeader(),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
              FirstRunUsernameField(controller: usernameController),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              FirstRunPasswordField(controller: passwordController),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              FirstRunConfirmField(
                controller: confirmController,
                passwordController: passwordController,
                onFieldSubmitted: (_) => onSubmit(),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h),
              LoginSubmitButton(
                label: 'login_first_run_submit',
                icon: Icons.person_add_outlined,
                large: true,
                onSubmit: onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
