import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Labelled settings option: title + hint on the leading edge, control on the
/// trailing edge.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_LARGE.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  title,
                  fontWeight: FontWeight.w600,
                  color: context.clinicTextPrimary,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
                ResponsiveText(
                  subtitle,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: context.clinicTextSecondary,
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
          trailing,
        ],
      ),
    );
  }
}
