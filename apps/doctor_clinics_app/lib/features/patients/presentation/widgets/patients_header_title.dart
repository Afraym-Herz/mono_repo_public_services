import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Heading of the patients record banner (`سجل المرضى`).
class PatientsHeaderTitle extends StatelessWidget {
  const PatientsHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      'patients_header.title'.tr(),
      fontSize: Dimensions.FONT_SIZE_LARGE,
      fontWeight: FontWeight.w700,
      color: context.clinicTextPrimary,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
