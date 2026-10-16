import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/remember_workstation_row.dart';

/// Username/password fields bound to parent-owned controllers.
///
/// The `Form`/`AutofillGroup` and the submit button live in the parent
/// ([LoginPanelBody]) so the primary CTA can anchor the end of the column.
class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.onSubmitted,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginFieldLabel('login_username_label'.tr()),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          AppTextField(
            controller: usernameController,
            hint: 'login_username_hint'.tr(),
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofocus: true,
            autofillHints: const [AutofillHints.username],
            validator: AppValidators.compose([
              AppValidators.required,
              AppValidators.minLength(4),
            ]),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Row(
            children: [
              Expanded(child: LoginFieldLabel('login_password_label'.tr())),
              TextButton(
                onPressed: () =>
                    AppSnackBar.showInfo(context, 'login_forgot_todo'.tr()),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'login_forgot'.tr(),
                  style: TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          AppTextField(
            controller: passwordController,
            hint: '••••••••••••',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
            onFieldSubmitted: (_) => onSubmitted(),
            validator: AppValidators.compose([
              AppValidators.required,
              AppValidators.minLength(6),
            ]),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          const RememberWorkstationRow(),
        ],
      ),
    );
  }
}
