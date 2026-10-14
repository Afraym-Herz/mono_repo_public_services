import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core/src/responsive/responsive_text.dart';
import 'package:core/src/theme/dimensions.dart';

/// Standalone reusable title & subtitle section for [AppFeatureHeader].
/// Strictly [StatelessWidget] with 0 private build methods (< 40 lines).
class AppFeatureHeaderTitle extends StatelessWidget {
  const AppFeatureHeaderTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveText(
          title,
          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
          responsive: false,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 4.h),
        ResponsiveText(
          subtitle,
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          responsive: false,
          color: Theme.of(context).hintColor,
        ),
      ],
    );
  }
}
