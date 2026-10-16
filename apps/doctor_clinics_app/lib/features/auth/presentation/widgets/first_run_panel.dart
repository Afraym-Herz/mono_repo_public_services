import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_submit_button.dart';

/// First-run setup form: creates the initial admin account.
///
/// Shown instead of the login form when [AuthState.firstRun] is emitted
/// (e.g. a fresh web profile whose local DB has no users yet). On success
/// [AuthCubit] emits `authenticated`, and the router redirects to `/home`.
class FirstRunPanel extends StatefulWidget {
  const FirstRunPanel({super.key});

  @override
  State<FirstRunPanel> createState() => _FirstRunPanelState();
}

class _FirstRunPanelState extends State<FirstRunPanel> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    TextInput.finishAutofillContext();
    context.read<AuthCubit>().createFirstUser(
      username: _usernameController.text.trim(),
      password: _passwordController.text,
    );
  }

  String? _confirmValidator(String? v) {
    if (v == null || v.isEmpty) return 'field_required'.tr();
    if (v != _passwordController.text) return 'login_password_mismatch'.tr();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 200),
      child: Form(
        key: _formKey,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ResponsiveText(
                'login_first_run_title'.tr(),
                fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE,
                fontWeight: FontWeight.w700,
                color: context.clinicTextPrimary,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              ResponsiveText(
                'login_first_run_subtitle'.tr(),
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                color: context.clinicTextSecondary,
                textAlign: TextAlign.start,
                height: 1.6,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
              LoginFieldLabel('login_username_label'.tr()),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              AppTextField(
                controller: _usernameController,
                hint: 'login_username_hint'.tr(),
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofocus: true,
                autofillHints: const [AutofillHints.newUsername],
                validator: AppValidators.compose([
                  AppValidators.required,
                  AppValidators.minLength(4),
                ]),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              LoginFieldLabel('login_password_label'.tr()),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              AppTextField(
                controller: _passwordController,
                hint: '••••••••••••',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.newPassword],
                validator: AppValidators.compose([
                  AppValidators.required,
                  AppValidators.minLength(6),
                ]),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              LoginFieldLabel('login_password_confirm_label'.tr()),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              AppTextField(
                controller: _confirmController,
                hint: '••••••••••••',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
                validator: _confirmValidator,
              ),
              SizedBox(height: Dimensions.paddingSizeDefault.h),
              LoginSubmitButton(
                label: 'login_first_run_submit',
                icon: Icons.person_add_outlined,
                large: true,
                onSubmit: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
