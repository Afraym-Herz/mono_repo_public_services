import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One icon + caption counter inside [HomeAppointmentsStats].
class HomeAppointmentsCount extends StatelessWidget {
  const HomeAppointmentsCount({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  /// Leading glyph.
  final IconData icon;

  /// Already-localized caption, e.g. `٥٤ حالة محجوزة`.
  final String label;

  /// Glyph colour.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: color),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w / 2),
        Flexible(
          child: ResponsiveText(
            label,
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
