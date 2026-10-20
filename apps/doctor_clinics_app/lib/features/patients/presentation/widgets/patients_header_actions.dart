import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Quick actions on the patients banner: Excel export + add new patient.
///
/// The muted export leads and the filled "new patient" trails, so the primary
/// action lands on the leading edge in RTL. [Wrap] keeps them from overflowing.
class PatientsHeaderActions extends StatelessWidget {
  const PatientsHeaderActions({super.key, this.onExport, this.onAddPatient});

  /// Exports the patient register to a spreadsheet.
  final VoidCallback? onExport;

  /// Opens the create-patient flow.
  final VoidCallback? onAddPatient;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      children: [
        AppPillButton(
          icon: Icons.file_download_outlined,
          label: 'patients_header.export_excel'.tr(),
          onTap: onExport ?? () {},
        ),
        AppPillButton(
          icon: Icons.add_rounded,
          label: 'patients_header.new_patient'.tr(),
          onTap: onAddPatient ?? () {},
          primary: true,
        ),
      ],
    );
  }
}
