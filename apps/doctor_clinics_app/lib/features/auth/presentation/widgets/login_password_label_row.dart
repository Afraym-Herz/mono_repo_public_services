import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/login_field_label.dart';

/// Password label (start) with the inline "forgot password" action (end).
class LoginPasswordLabelRow extends StatelessWidget {
  const LoginPasswordLabelRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
