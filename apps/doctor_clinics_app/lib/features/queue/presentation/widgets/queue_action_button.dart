import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QueueActionButton extends StatelessWidget {
  const QueueActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDanger = false,
    this.isSubmitting = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isDanger;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? AppColors.clinicError : AppColors.clinicPrimary;
    return OutlinedButton(
      onPressed: isSubmitting ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(
          color: isSubmitting ? AppColors.borderPrimary : color,
          width: 1.w,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL.w,
          vertical: Dimensions.PADDING_SIZE_BORDER.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isSubmitting ? AppColors.textHint : color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
