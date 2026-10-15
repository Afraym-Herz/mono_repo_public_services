import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
import 'package:core/src/responsive/responsive_text.dart';
import 'package:core/src/theme/dimensions.dart';

/// Standalone widget displaying the signed-in user's avatar and name.
class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AppAuthCubit>().state;
    final String initial = authState.maybeWhen(
      authenticated: (user) =>
          user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
      orElse: () => 'U',
    );
    final String name = authState.maybeWhen(
      authenticated: (user) => user.name,
      orElse: () => 'header.user_fallback_name'.tr(),
    );

    return FadeInUp(
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 300),
      child: Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: Theme.of(
            context,
          ).primaryColor.withValues(alpha: 0.12),
          child: ResponsiveText(
            initial,
            fontSize: Dimensions.FONT_SIZE_LARGE,
            responsive: false,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        ResponsiveText(
          name,
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          responsive: false,
          fontWeight: FontWeight.bold,
        ),
      ],
      ),
    );
  }
}
