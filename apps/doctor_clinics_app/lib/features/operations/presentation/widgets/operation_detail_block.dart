import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Inset section inside an expanded operation card.
class OperationDetailBlock extends StatelessWidget {
  const OperationDetailBlock({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.trailing,
  });

  final String title;
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
      decoration: BoxDecoration(
        color: context.clinicInset,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: Dimensions.ICON_SIZE_SMALL.r,
                color: context.clinicPrimary,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
              Expanded(
                child: ResponsiveText(
                  title,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.w700,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // ignore: use_null_aware_elements
              if (trailing != null) trailing!,
            ],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          child,
        ],
      ),
    );
  }
}
