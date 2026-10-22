import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patient_form_duplicate_card.dart';

/// Overlay content of the duplicate check: a tap-to-dismiss barrier plus the
/// floating card anchored under the name field.
class PatientFormNameMatches extends StatelessWidget {
  const PatientFormNameMatches({
    super.key,
    required this.width,
    required this.link,
    required this.onDismiss,
  });

  final double width;
  final LayerLink link;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onDismiss,
            ),
          ),
          CompositedTransformFollower(
            link: link,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: Offset(0, Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            child: SizedBox(
              width: width,
              child: const PatientFormDuplicateCard(),
            ),
          ),
        ],
      ),
    );
  }
}
