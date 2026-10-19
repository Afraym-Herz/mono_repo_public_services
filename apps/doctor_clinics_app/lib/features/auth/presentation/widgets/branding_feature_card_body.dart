import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/branding_panel_hover_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/cubit/branding_panel_hover_state.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_feature_card_content.dart';

/// Hover-lifting body of a branding feature card (state via
/// [BrandingPanelHoverCubit] — no `setState`).
class BrandingFeatureCardBody extends StatelessWidget {
  const BrandingFeatureCardBody({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.stat,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? stat;

  @override
  Widget build(BuildContext context) {
    final isDark = context.clinicIsDark;
    return MouseRegion(
      onEnter: (_) => context.read<BrandingPanelHoverCubit>().enter(),
      onExit: (_) => context.read<BrandingPanelHoverCubit>().exit(),
      child: BlocBuilder<BrandingPanelHoverCubit, BrandingPanelHoverState>(
        builder: (context, state) {
          final hovered = state.hovered;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
            transform: Matrix4.translationValues(0, hovered ? -4 : 0, 0),
            decoration: BoxDecoration(
              color: isDark ? context.clinicContainer : AppColors.white,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
              border: Border.all(
                color: hovered
                    ? AppColors.clinicPrimaryContainer.withValues(alpha: 0.45)
                    : context.clinicBorder,
              ),
              boxShadow: [
                BoxShadow(
                  color: hovered
                      ? AppColors.clinicPrimaryContainer.withValues(alpha: 0.20)
                      : AppColors.shadowLight,
                  blurRadius: hovered ? 16.r : 10.r,
                  offset: Offset(0, hovered ? 8.h : 4.h),
                ),
              ],
            ),
            child: BrandingFeatureCardContent(
              icon: icon,
              title: title,
              subtitle: subtitle,
              stat: stat,
            ),
          );
        },
      ),
    );
  }
}
