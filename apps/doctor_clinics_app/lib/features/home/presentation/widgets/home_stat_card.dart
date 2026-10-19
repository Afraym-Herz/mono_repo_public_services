import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_card_body.dart';
import 'home_stat_card_header.dart';

/// Reusable dashboard metric card used by the home canvas: a localized [title]
/// with a tinted [icon] chip, the headline [value] (with optional [unit] and
/// [subtitle] lines) and an optional custom [footer] detail row. Every home
/// dashboard card ([HomeStatsRow]) composes this so the chrome stays identical.
class HomeStatCard extends StatelessWidget {
  const HomeStatCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.unit,
    this.subtitle,
    this.iconColor,
    this.footer,
    this.animationDelay = Duration.zero,
  });

  /// Already-localized metric label shown in the card header.
  final String title;
  /// Glyph rendered inside the tinted chip in the card header.
  final IconData icon;
  /// Already-formatted headline figure (locale-aware digits).
  final String value;
  /// Optional unit rendered next to [value], e.g. `ج.م.`.
  final String? unit;
  /// Optional caption rendered under [value], e.g. `مريض مسجل`.
  final String? subtitle;
  /// Tint for the header chip; defaults to the clinical accent.
  final Color? iconColor;
  /// Optional custom detail row docked at the bottom of the card.
  final Widget? footer;
  /// Stagger delay for the [FadeInUp] entrance animation.
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final surface = context.clinicIsDark
        ? context.clinicContainer
        : context.cardColor;

    return FadeInUp(
      delay: animationDelay,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeStatCardHeader(title: title, icon: icon, iconColor: iconColor),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            HomeStatCardBody(
              value: value,
              unit: unit,
              subtitle: subtitle,
              footer: footer,
            ),
          ],
        ),
      ),
    );
  }
}
