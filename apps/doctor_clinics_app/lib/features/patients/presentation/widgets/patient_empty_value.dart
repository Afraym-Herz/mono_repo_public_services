import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Small secondary em dash used when a cell has no stored value.
class PatientEmptyValue extends StatelessWidget {
  const PatientEmptyValue({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      'patients.table.none'.tr(),
      fontSize: Dimensions.FONT_SIZE_SMALL,
      color: context.clinicTextSecondary,
    );
  }
}
