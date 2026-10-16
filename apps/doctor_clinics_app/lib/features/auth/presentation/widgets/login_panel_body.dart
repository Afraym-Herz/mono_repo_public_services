import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/centered_panel.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_footer.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_form.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_status_box.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_submit_button.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_title_block.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_top_bar.dart';

/// Login column: top bar, headline, fields, status, footer, then the large
/// submit CTA anchoring the end of the column.
///
/// Owns the credential controllers + form key (controllers live in `State`,
/// never `setState` — submission flows through [AuthCubit]).
class LoginPanelBody extends StatefulWidget {
  const LoginPanelBody({super.key});

  @override
  State<LoginPanelBody> createState() => _LoginPanelBodyState();
}

class _LoginPanelBodyState extends State<LoginPanelBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
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
    TextInput.finishAutofillContext();
    context.read<AuthCubit>().login(
      _usernameController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CenteredPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const LoginTopBar(),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h),
          const LoginTitleBlock(),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          Form(
            key: _formKey,
            child: AutofillGroup(
              child: LoginForm(
                usernameController: _usernameController,
                passwordController: _passwordController,
                onSubmitted: _submit,
              ),
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeDefault.h),
          const LoginStatusBox(),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          const LoginFooter(),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h * 4),
          LoginSubmitButton(large: true, onSubmit: _submit),
        ],
      ),
    );
  }
}
