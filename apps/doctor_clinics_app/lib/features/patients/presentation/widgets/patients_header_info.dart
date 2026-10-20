import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patients_header_title.dart';
import 'patients_live_update_label.dart';
import 'patients_registered_badge.dart';

/// Leading half of [PatientsHeader]: title, registered count and live note.
///
/// Laid out with [Wrap] so the badge and note drop to a second line instead of
/// overflowing on narrow windows.
class PatientsHeaderInfo extends StatelessWidget {
  const PatientsHeaderInfo({super.key, required this.patientCount});

  /// Number of patients currently stored on the station.
  final int patientCount;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_BORDER.h,
      children: [
        const PatientsHeaderTitle(),
        PatientsRegisteredBadge(count: patientCount),
        const PatientsLiveUpdateLabel(),
      ],
    );
  }
}
