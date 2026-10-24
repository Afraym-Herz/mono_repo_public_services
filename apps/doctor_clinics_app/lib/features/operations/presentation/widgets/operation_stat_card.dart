import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_stat_icon.dart';

/// One KPI tile of the operations board.
class OperationStatCard extends StatelessWidget {
  const OperationStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.animationDelay = Duration.zero,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: animationDelay,
      duration: const Duration(milliseconds: 350),
      child: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: Row(
          children: [
            OperationStatIcon(icon: icon, color: color),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ResponsiveText(
                    title,
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: context.clinicTextSecondary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h / 2),
                  ResponsiveText(
                    value,
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    fontWeight: FontWeight.w700,
                    color: context.clinicTextPrimary,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
