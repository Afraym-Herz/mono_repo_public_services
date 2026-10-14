import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/src/custom/animated_custom_dialog.dart';
import 'package:core/src/custom/custom_ink_well.dart';
import 'package:core/src/custom/logout_dialog.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:core/src/dependency_injection/setup_locator.dart';
import 'package:core/src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:core/src/auth/auth_repository.dart';

/// Standalone button triggering the logout confirmation dialog.
class HeaderLogoutButton extends StatelessWidget {
  const HeaderLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () => _showLogoutDialog(context),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        ),
        child: Icon(
          Icons.logout_rounded,
          color: Theme.of(context).primaryColor,
          size: 22.r,
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showAnimatedDialog(
      context,
      CustomDialog(
        icon: Icons.logout_rounded,
        title: 'auth.logout_confirm_title'.tr(),
        description: 'auth.logout_confirm_message'.tr(),
        onTapFalse: () => Navigator.of(context).pop(),
        onTapTrue: () async {
          Navigator.of(context).pop();
          // Trigger global state refresh to route to login immediately
          getIt<AppAuthCubit>().logOut();
          // Clear backend session & local storage
          await getIt<AuthRepository>().logout();
        },
      ),
    );
  }
}
