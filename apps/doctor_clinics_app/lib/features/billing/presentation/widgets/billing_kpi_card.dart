import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'billing_kpi_header.dart';
import 'billing_kpi_progress.dart';
import 'billing_kpi_value.dart';

/// One headline metric on the accounts summary.
class BillingKpiCard extends StatelessWidget {
  const BillingKpiCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.unit,
    this.subtitle,
    this.iconColor,
    this.valueColor,
    this.progress,
    this.animationDelay = Duration.zero,
  });

  final String title;
  final IconData icon;
  final String value;
  final String unit;
  final String? subtitle;
  final Color? iconColor;
  final Color? valueColor;
  final double? progress;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final accent = iconColor ?? context.clinicAccent;
    return FadeInUp(
      delay: animationDelay,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL.r),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillingKpiHeader(title: title, icon: icon, color: accent),
            SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
            BillingKpiValue(
              value: value,
              unit: unit,
              color: valueColor ?? context.clinicTextPrimary,
            ),
            if (subtitle != null) ...[
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              ResponsiveText(
                subtitle!,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: context.clinicTextSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (progress != null) ...[
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              BillingKpiProgress(value: progress!, color: accent),
            ],
          ],
        ),
      ),
    );
  }
}
