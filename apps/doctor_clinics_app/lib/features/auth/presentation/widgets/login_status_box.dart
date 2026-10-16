import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';

/// Offline status strip reflecting the real auth/DB state (MVP-OFFLINE:
/// local DB readiness, never cloud).
///
/// - checking (initial/loading) → spinner + "connecting" message
/// - first run → setup prompt instead of a misleading "ready"
/// - error → error icon + message instead of a misleading "ready"
class LoginStatusBox extends StatelessWidget {
  const LoginStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isChecking = state.maybeWhen(
          initial: () => true,
          loading: () => true,
          orElse: () => false,
        );
        final isSetup = state.maybeWhen(
          firstRun: () => true,
          orElse: () => false,
        );
        final hasError = state.maybeWhen(
          error: (_) => true,
          orElse: () => false,
        );
        final message = isChecking
            ? 'login_status_checking'.tr()
            : isSetup
            ? 'login_status_setup'.tr()
            : hasError
            ? 'login_status_error'.tr()
            : 'login_status_ok'.tr();
        final Widget leading = isChecking
            ? SizedBox(
                width: Dimensions.NAVBAR_ICON_SIZE.r,
                height: Dimensions.NAVBAR_ICON_SIZE.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2.r,
                  color: context.clinicPrimary,
                ),
              )
            : Icon(
                isSetup
                    ? Icons.person_add_outlined
                    : hasError
                    ? Icons.error_outline
                    : Icons.check_circle,
                size: Dimensions.NAVBAR_ICON_SIZE.r,
                color: hasError
                    ? context.errorColor
                    : isSetup
                    ? context.clinicPrimary
                    : AppColors.successDark,
              );
        return ZoomIn(
          duration: const Duration(milliseconds: 400),
          delay: const Duration(milliseconds: 400),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_SMALL.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicContainer,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
              border: Border.all(color: context.clinicBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      leading,
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                      Flexible(
                        child: ResponsiveText(
                          message,
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          fontWeight: FontWeight.w600,
                          color: context.clinicTextPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                ResponsiveText(
                  'login_status_mode'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: context.clinicTextSecondary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
