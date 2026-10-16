import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';

/// Auth CTA driven by [AuthCubit] (loading spinner + inline error text).
///
/// Renders large and anchors the end of the auth column when [large] is set
/// (login + first-run setup share this widget).
class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    super.key,
    required this.onSubmit,
    this.label = 'login_submit',
    this.icon = Icons.login_outlined,
    this.large = false,
  });

  final VoidCallback onSubmit;
  final String label;
  final IconData icon;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 350),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );
          final error = state.maybeWhen(
            error: (message) => message,
            orElse: () => null,
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (error != null && error.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
                  ),
                  child: ResponsiveText(
                    error,
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    color: context.errorColor,
                    textAlign: TextAlign.start,
                  ),
                ),
              AppButton(
                label: label.tr(),
                icon: icon,
                height: large ? 56.h : Dimensions.CONTROL_HEIGHT.h,
                fontSize: large ? Dimensions.FONT_SIZE_LARGE : null,
                color: context.clinicSubmitButton,
                isLoading: isLoading,
                onPressed: isLoading ? null : onSubmit,
              ),
            ],
          );
        },
      ),
    );
  }
}
