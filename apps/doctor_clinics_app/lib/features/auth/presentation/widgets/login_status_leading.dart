import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Leading status glyph: spinner while checking, otherwise a state-tinted icon.
class LoginStatusLeading extends StatelessWidget {
  const LoginStatusLeading({
    super.key,
    required this.isChecking,
    required this.isSetup,
    required this.hasError,
  });

  final bool isChecking;
  final bool isSetup;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return isChecking
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
  }
}
