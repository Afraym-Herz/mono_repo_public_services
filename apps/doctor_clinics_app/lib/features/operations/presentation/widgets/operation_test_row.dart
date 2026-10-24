import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Tappable pre-operation checklist row.
class OperationTestRow extends StatelessWidget {
  const OperationTestRow({
    super.key,
    required this.label,
    required this.isDone,
    required this.onTap,
  });

  final String label;
  final bool isDone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_BORDER.h,
          ),
          child: Row(
            children: [
              Icon(
                isDone
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                size: Dimensions.ICON_SIZE_SMALL.r,
                color: isDone
                    ? context.clinicStatusDone
                    : context.clinicTextSecondary,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(
                child: ResponsiveText(
                  label,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  fontWeight: isDone ? FontWeight.w500 : FontWeight.w600,
                  color: isDone
                      ? context.clinicTextSecondary
                      : context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
