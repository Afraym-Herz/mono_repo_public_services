import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Login panel footer: clinic name + version.
class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 500),
      child: Text(
        'login_footer'.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Dimensions.FONT_SIZE_SMALL.sp,
          color: context.clinicTextSecondary,
        ),
      ),
    );
  }
}
