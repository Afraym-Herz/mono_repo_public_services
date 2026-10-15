import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// DESIGN label-md: start-aligned semibold label above each input.
class LoginFieldLabel extends StatelessWidget {
  const LoginFieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: TextStyle(
          fontSize: Dimensions.FONT_SIZE_SMALL.sp,
          fontWeight: FontWeight.w600,
          color: context.clinicTextPrimary,
        ),
      ),
    );
  }
}
