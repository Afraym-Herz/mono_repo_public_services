import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Branding canvas filling the 2/3 split beside the auth panel.
///
/// Layout (RTL-first, per DESIGN reference):
/// - header  : logo badge + clinic identity (start), release pill (end)
/// - middle  : eyebrow badge, headline, supporting paragraph
/// - cards   : three feature cards in a row
/// - footer  : availability + hotline + version-upgrade pill
class BrandingPanel extends StatelessWidget {
  const BrandingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.clinicBackground,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
      child: Container(
        // One soft gradient card holding the whole branding content and
        // stretching to every available side. Inner padding lives inside the
        // ClipRRect so the decorative blobs bleed to the card edge.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: context.clinicIsDark
                ? [
                    AppColors.clinicBackgroundDark,
                    AppColors.clinicSurfaceContainerDark,
                  ]
                : [
                    AppColors.white,
                    context.clinicContainer,
                  ],
          ),
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
          border: Border.all(color: context.clinicBorder),
          boxShadow: [
            BoxShadow(
              color: AppColors.clinicPrimaryContainer.withOpacity(0.12),
              blurRadius: 24.r,
              offset: Offset(0, 10.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
          child: Stack(
            children: [
              const _DecorativeBlobs(),
              Padding(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _Header(),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const _HeadlineBlock(),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h,
                            ),
                            const _FeatureCards(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h),
                    const _Footer(),
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

/// Soft out-of-focus teal circles adding depth inside the gradient card.
class _DecorativeBlobs extends StatelessWidget {
  const _DecorativeBlobs();

  @override
  Widget build(BuildContext context) {
    final tint = AppColors.clinicPrimaryContainer.withOpacity(
      context.clinicIsDark ? 0.08 : 0.06,
    );
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            PositionedDirectional(
              bottom: -60.h,
              end: -60.w,
              child: Container(
                width: 220.r,
                height: 220.r,
                decoration: BoxDecoration(color: tint, shape: BoxShape.circle),
              ),
            ),
            PositionedDirectional(
              top: -40.h,
              start: -30.w,
              child: Container(
                width: 140.r,
                height: 140.r,
                decoration: BoxDecoration(color: tint, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Logo badge + clinic name (start) and the release-available pill (end).
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 400),
      child: Row(
        children: [
          const _LogoBadge(),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  'branding_clinic_name'.tr(),
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w700,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                ResponsiveText(
                  'branding_clinic_tagline'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL - 1,
                  color: context.clinicPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const _ReleasePill(),
        ],
      ),
    );
  }
}

/// Circular teal gradient logo badge with a medical cross icon.
class _LogoBadge extends StatelessWidget {
  const _LogoBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.r,
      height: 48.r,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [AppColors.clinicPrimary, AppColors.clinicPrimaryContainer],
        ),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.clinicPrimaryContainer.withOpacity(0.35),
            blurRadius: 14.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Icon(
        Icons.medical_services_outlined,
        size: Dimensions.ICON_SIZE_DEFAULT.r,
        color: Colors.white,
      ),
    );
  }
}

/// Softly looping "live" status indicator (breathe-in/out).
class _PulsingDot extends StatefulWidget {
  const _PulsingDot();

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 0.75, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _scale,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          width: Dimensions.ICON_SIZE_VERY_SMALL.r,
          height: Dimensions.ICON_SIZE_VERY_SMALL.r,
          decoration: BoxDecoration(
            color: context.clinicAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

/// White pill on the trailing side announcing the downloadable release.
class _ReleasePill extends StatelessWidget {
  const _ReleasePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicIsDark
            ? context.clinicContainer
            : AppColors.white,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _PulsingDot(),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          ResponsiveText(
            'branding_release_pill'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL - 1,
            fontWeight: FontWeight.w600,
            color: context.clinicTextSecondary,
          ),
        ],
      ),
    );
  }
}

/// Eyebrow badge + headline + supporting paragraph, start-aligned.
class _HeadlineBlock extends StatelessWidget {
  const _HeadlineBlock();

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.palette_outlined,
                  size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
                  color: context.clinicPrimary,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                ResponsiveText(
                  'branding_eyebrow'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL - 1,
                  fontWeight: FontWeight.w600,
                  color: context.clinicPrimary,
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          ResponsiveText(
            'branding_headline'.tr(),
            fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE + 2,
            fontWeight: FontWeight.w800,
            height: 1.35,
            color: context.clinicTextPrimary,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          ResponsiveText(
            'branding_body'.tr(),
            fontSize: Dimensions.FONT_SIZE_DEFAULT - 1,
            height: 1.6,
            color: context.clinicTextSecondary,
          ),
        ],
      ),
    );
  }
}

/// Row of the three feature cards (quick registration, triage, billing).
class _FeatureCards extends StatelessWidget {
  const _FeatureCards();

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 200),
      // IntrinsicHeight forces every card to match the tallest sibling, so
      // all three render with identical width (Expanded) and height.
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _FeatureCard(
                icon: Icons.flash_on,
                title: 'branding_card_fast_title'.tr(),
                subtitle: 'branding_card_fast_body'.tr(),
                stat: 'branding_card_fast_stat'.tr(),
                isFeatured: true,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              child: _FeatureCard(
                icon: Icons.medical_information_outlined,
                title: 'branding_card_records_title'.tr(),
                subtitle: 'branding_card_records_body'.tr(),
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              child: _FeatureCard(
                icon: Icons.receipt_long_outlined,
                title: 'branding_card_billing_title'.tr(),
                subtitle: 'branding_card_billing_body'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// White card with gradient icon tile, title, optional stat chip and body.
/// Hovering lifts the card on desktop, matching desktop-UI conventions.
class _FeatureCard extends StatefulWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.stat,
    this.isFeatured = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? stat;
  final bool isFeatured;

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.clinicIsDark;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: isDark ? context.clinicContainer : AppColors.white,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(
            color: widget.isFeatured || _hovered
                ? AppColors.clinicPrimaryContainer.withOpacity(0.45)
                : context.clinicBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? AppColors.clinicPrimaryContainer.withOpacity(0.20)
                  : AppColors.shadowLight,
              blurRadius: _hovered ? 16.r : 10.r,
              offset: Offset(0, _hovered ? 8.h : 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                gradient: widget.isFeatured
                    ? const LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          AppColors.clinicPrimary,
                          AppColors.clinicPrimaryContainer,
                        ],
                      )
                    : null,
                color: widget.isFeatured
                    ? null
                    : context.clinicAccent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
              ),
              child: Icon(
                widget.icon,
                size: Dimensions.ICON_SIZE_SMALL.r,
                color: widget.isFeatured ? Colors.white : null,
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            ResponsiveText(
              widget.title,
              fontSize: Dimensions.FONT_SIZE_DEFAULT - 1,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            Expanded(
              child: ResponsiveText(
                widget.subtitle,
                fontSize: Dimensions.FONT_SIZE_SMALL - 1,
                height: 1.5,
                color: context.clinicTextSecondary,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (widget.stat != null) ...[
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              ResponsiveText(
                widget.stat!,
                fontSize: Dimensions.FONT_SIZE_SMALL - 1,
                fontWeight: FontWeight.w700,
                color: AppColors.clinicPrimaryContainer,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Bottom row: availability (start), hotline (center), upgrade pill (end).
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 1.h, color: context.clinicBorder),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          Row(
            children: [
              Tooltip(
                message: 'branding_footer_availability_tip'.tr(),
                child: _FooterItem(
                  icon: Icons.schedule,
                  text: 'branding_footer_availability'.tr(),
                  color: AppColors.clinicSecondary,
                ),
              ),
              const Spacer(),
              Tooltip(
                message: 'branding_footer_hotline_tip'.tr(),
                child: _FooterItem(
                  icon: Icons.call_outlined,
                  text: 'branding_footer_hotline'.tr(),
                  color: context.clinicTextSecondary,
                ),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              const _UpgradePill(),
            ],
          ),
        ],
      ),
    );
  }
}

/// Small inline helper: icon + single-line secondary text.
class _FooterItem extends StatelessWidget {
  const _FooterItem({
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: color),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        ResponsiveText(
          text,
          fontSize: Dimensions.FONT_SIZE_SMALL - 1,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ],
    );
  }
}

/// Pill highlighting the upgraded release on the trailing footer side.
class _UpgradePill extends StatelessWidget {
  const _UpgradePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicIsDark
            ? context.clinicContainer
            : AppColors.white,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bolt,
            size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
            color: AppColors.clinicPrimaryContainer,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          ResponsiveText(
            'branding_footer_upgrade'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL - 1,
            fontWeight: FontWeight.w600,
            color: context.clinicTextSecondary,
          ),
        ],
      ),
    );
  }
}
