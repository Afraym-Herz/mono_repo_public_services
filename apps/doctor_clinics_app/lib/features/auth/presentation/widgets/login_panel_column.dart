import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_footer.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_form.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_status_box.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_submit_button.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_title_block.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_top_bar.dart';

/// Login column layout: top bar, headline, credential form, status strip,
/// footer, then the large submit CTA anchoring the end of the column.
class LoginPanelColumn extends StatelessWidget {
  const LoginPanelColumn({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.onSubmit,
  });

  /// Form key owned by the parent, used to validate on submit.
  final GlobalKey<FormState> formKey;

  /// Username controller owned by the parent.
  final TextEditingController usernameController;

  /// Password controller owned by the parent.
  final TextEditingController passwordController;

  /// Invoked by the field submit action and the CTA.
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LoginTopBar(),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h),
        const LoginTitleBlock(),
        SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
        Form(
          key: formKey,
          child: AutofillGroup(
            child: LoginForm(
              usernameController: usernameController,
              passwordController: passwordController,
              onSubmitted: onSubmit,
            ),
          ),
        ),
        SizedBox(height: Dimensions.paddingSizeDefault.h),
        const LoginStatusBox(),
        SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
        const LoginFooter(),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h * 2),
        LoginSubmitButton(large: true, onSubmit: onSubmit),
      ],
    );
  }
}
