import 'package:core/src/responsive/responsive_text.dart';
import 'package:core/src/theme/color_extensions.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Muted meta line that sits under a feature header (home greeting, queue
/// banner, …): a leading icon followed by `label <sep> detail`, e.g.
/// `الخميس ١٥ أكتوبر ٢٠٢٦ | دوام العيادة: الفترة الصباحية`.
///
/// Callers pass already-formatted, already-localized strings — format dates
/// through `DateConverter` so the digits stay locale-aware.
class AppMetaRow extends StatelessWidget {
  const AppMetaRow({
    super.key,
    required this.label,
    required this.detail,
    this.icon = Icons.calendar_today_rounded,
    this.separator = '•',
  });

  /// Leading icon.
  final IconData icon;

  /// Leading segment — typically the date.
  final String label;

  /// Trailing segment — typically the clinic hours / active session window.
  final String detail;

  /// Glyph rendered between [label] and [detail].
  final String separator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Dimensions.ICON_SIZE_SMALL.r,
          color: context.clinicTextSecondary,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Flexible(
          child: ResponsiveText(
            '$label   $separator   $detail',
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
