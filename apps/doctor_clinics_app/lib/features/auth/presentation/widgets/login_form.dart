import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_submit_button.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/remember_workstation_row.dart';

/// Username/password form. Controllers live in [State] (no `setState` —
/// checkbox state flows through `RememberMeCubit`, submit via `AuthCubit`).
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(
      text: 'dr.youssef@clinic.local',
    );
    _passwordController = TextEditingController(text: 'SecretClinicPass123');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    context.read<AuthCubit>().login(
      _usernameController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 200),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginFieldLabel('login_username_label'.tr()),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            AppTextField(
              controller: _usernameController,
              hint: 'login_username_hint'.tr(),
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
              controller: _passwordController,
              hint: '••••••••••••',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: AppValidators.compose([
                AppValidators.required,
                AppValidators.minLength(6),
              ]),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            const RememberWorkstationRow(),
            SizedBox(height: Dimensions.paddingSizeDefault.h),
            LoginSubmitButton(onSubmit: _submit),
          ],
        ),
      ),
    );
  }
}
