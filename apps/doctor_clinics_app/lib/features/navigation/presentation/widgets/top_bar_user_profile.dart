import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Signed-in user block for the workspace [TopBar]: avatar, name and role.
///
/// Reads the shared auth state ([AppAuthCubit]) so it stays in sync with
/// login/logout. Role labels are resolved from `role_<token>` translation keys
/// with a graceful fallback to the raw token.
class TopBarUserProfile extends StatelessWidget {
  const TopBarUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AppAuthCubit>().state;
    final user = authState.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    final name = user?.name.isNotEmpty == true
        ? user!.name
        : 'header.user_fallback_name'.tr();
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'U';
    final role = _roleLabel(user?.role);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: context.clinicNavActiveBackground,
          child: ResponsiveText(
            initial,
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            responsive: false,
            fontWeight: FontWeight.bold,
            color: context.clinicAccent,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveText(
                name,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                fontWeight: FontWeight.w700,
                color: context.clinicTextPrimary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ResponsiveText(
                role,
                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                color: context.clinicTextSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Resolves a role token (e.g. `secretary`) to a localized label.
///
/// Falls back to the fallback role key, then to the raw token, so unknown
/// roles never render as an empty string.
String _roleLabel(String? role) {
  if (role == null || role.trim().isEmpty) {
    return 'header.user_fallback_role'.tr();
  }
  final token = role.trim().toLowerCase();
  final key = 'role_$token';
  final label = key.tr();
  return label == key ? role : label;
}
