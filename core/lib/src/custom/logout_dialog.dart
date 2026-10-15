import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logout_dialog_actions.dart';
import 'logout_dialog_body.dart';
import 'logout_dialog_header.dart';

class CustomDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final bool delete;
  final String title;
  final String description;
  final Function()? onTapTrue;
  final String? onTapTrueText;
  final Function()? onTapFalse;
  final String? onTapFalseText;
  final bool? isInternetCheck;
  const CustomDialog({
    super.key,
    this.isFailed = false,
    this.rotateAngle = 0,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTapFalse,
    required this.onTapTrue,
    this.onTapTrueText,
    this.onTapFalseText,
    this.delete = false,
    this.isInternetCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Dimensions.WEB_MAX_WIDTH * 0.34),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              LogoutDialogHeader(
                icon: icon,
                rotateAngle: rotateAngle,
                delete: delete,
                isFailed: isFailed,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LogoutDialogBody(title: title, description: description),
                    const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    LogoutDialogActions(
                      onTapFalse: onTapFalse,
                      onTapTrue: onTapTrue,
                      onTapTrueText: onTapTrueText,
                      onTapFalseText: onTapFalseText,
                      isInternetCheck: isInternetCheck,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
