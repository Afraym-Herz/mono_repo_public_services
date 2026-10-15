import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_footer.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_form.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_status_box.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_title_block.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_top_bar.dart';

/// Constrained auth column composing the login widgets.
class LoginPanel extends StatelessWidget {
  const LoginPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => curr.maybeWhen(
        error: (_) => true,
        firstRun: () => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.whenOrNull(
          error: (message) => AppSnackBar.showError(
            context,
            message.isEmpty ? 'login_error_generic'.tr() : message,
          ),
          firstRun: () => AppSnackBar.showInfo(context, 'login_first_run'.tr()),
        );
      },
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Dimensions.LOGIN_PANEL_MAX_WIDTH,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LoginTopBar(),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h),
                const LoginTitleBlock(),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
                const LoginForm(),
                SizedBox(height: Dimensions.paddingSizeDefault.h),
                const LoginStatusBox(),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
                const LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
