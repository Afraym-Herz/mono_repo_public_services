import 'package:core/src/theme/app_colors.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:core/src/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular icon header for [CustomDialog] (see `logout_dialog.dart`).
class LogoutDialogHeader extends StatelessWidget {
  const LogoutDialogHeader({
    super.key,
    required this.icon,
    required this.rotateAngle,
    required this.delete,
    required this.isFailed,
  });

  final IconData icon;
  final double rotateAngle;
  final bool delete;
  final bool isFailed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: delete
          ? 0
          : -(Dimensions.HEIGHT_WIDTH_50.h +
                Dimensions.PADDING_SIZE_MEDIUM_BORDER.h),
      child: Container(
        height: delete
            ? Dimensions.HEIGHT_WIDTH_50.h
            : (Dimensions.HEIGHT_WIDTH_50 +
                      Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE)
                  .h,
        width: delete
            ? Dimensions.HEIGHT_WIDTH_50.w
            : (Dimensions.HEIGHT_WIDTH_50 +
                      Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE)
                  .w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: delete || isFailed
              ? ThemeManager.getRedColor()
              : Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: Transform.rotate(
          angle: rotateAngle,
          child: Icon(
            icon,
            size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
            color: delete
                ? Theme.of(context).secondaryHeaderColor
                : AppColors.white,
          ),
        ),
      ),
    );
  }
}
