import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agreements/core/custom/app_button.dart';
import 'package:agreements/core/custom/app_feature_header_title.dart';
import 'package:agreements/core/responsive/responsive_extensions.dart';
import 'package:agreements/core/theme/dimensions.dart';

/// Centralized reusable feature header banner (`AppFeatureHeader`).
/// Used across all ERP features (`Orders`, `Customers`, etc.) with responsive layout and micro-animations.
class AppFeatureHeader extends StatelessWidget {
  const AppFeatureHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.actionIcon = Icons.add_rounded,
    this.onActionPressed,
    this.customActionWidget,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final Widget? customActionWidget;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_LARGE.h,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = context.isMobile || constraints.maxWidth < 600;
            final action =
                customActionWidget ??
                (actionLabel != null
                    ? AppButton(
                        label: actionLabel!,
                        icon: actionIcon ?? Icons.add_rounded,
                        width: isCompact ? double.infinity : null,
                        height: 46.h,
                        onPressed: onActionPressed ?? () {},
                      )
                    : const SizedBox.shrink());

            final titleWidget = AppFeatureHeaderTitle(
              title: title,
              subtitle: subtitle,
            );

            if (isCompact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  titleWidget,
                  if (actionLabel != null || customActionWidget != null) ...[
                    SizedBox(height: Dimensions.paddingSizeDefault.h),
                    action,
                  ],
                ],
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: titleWidget),
                if (actionLabel != null || customActionWidget != null) ...[
                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
                  action,
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
