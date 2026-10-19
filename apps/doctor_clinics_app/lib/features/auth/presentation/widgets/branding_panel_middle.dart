import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_feature_cards.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_headline_block.dart';

/// Vertically centered, scrollable middle block: headline + feature cards,
/// at least filling the space its parent `Expanded` grants it.
class BrandingPanelMiddle extends StatelessWidget {
  const BrandingPanelMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            // At least the full size of the Expanded slot: width keeps the
            // stretch direction, height lets the block vertically center when
            // there's spare room; on short windows it scrolls normally.
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const BrandingHeadlineBlock(),
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h,
                  ),
                  const BrandingFeatureCards(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
