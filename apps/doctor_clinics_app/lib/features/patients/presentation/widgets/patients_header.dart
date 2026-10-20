import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patients_header_actions.dart';
import 'patients_header_info.dart';

/// Banner docked under the workspace top bar on the patients screen.
///
/// The title, registered count and live-update note sit on the leading edge,
/// the export / add-patient actions on the trailing edge. Below the small-tablet
/// breakpoint the actions drop under the heading instead of overflowing.
class PatientsHeader extends StatelessWidget {
  const PatientsHeader({
    super.key,
    required this.patientCount,
    this.onAddPatient,
    this.onExport,
  });

  /// Number of patients currently stored on the station.
  final int patientCount;

  /// Opens the create-patient flow.
  final VoidCallback? onAddPatient;

  /// Exports the patient register to a spreadsheet.
  final VoidCallback? onExport;

  @override
  Widget build(BuildContext context) {
    final info = PatientsHeaderInfo(patientCount: patientCount);
    final actions = PatientsHeaderActions(
      onAddPatient: onAddPatient,
      onExport: onExport,
    );

    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_LARGE.h,
        ),
        child: context.isMobileOrSmallTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  info,
                  SizedBox(height: Dimensions.paddingSizeDefault.h),
                  actions,
                ],
              )
            : Row(
                children: [
                  Expanded(child: info),
                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
                  actions,
                ],
              ),
      ),
    );
  }
}
