import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_section_link.dart';

/// Foot of a home section card: a hairline rule separating the "view all" link
/// from the section body above it.
class HomeSectionFooter extends StatelessWidget {
  const HomeSectionFooter({super.key, required this.label, required this.route});

  /// Already-localized link caption.
  final String label;

  /// Route opened when the link is tapped.
  final String route;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(
          height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
          thickness: 1,
          color: context.clinicBorder,
        ),
        HomeSectionLink(label: label, route: route),
      ],
    );
  }
}
