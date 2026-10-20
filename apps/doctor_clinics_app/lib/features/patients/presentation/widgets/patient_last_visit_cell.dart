import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../helpers/patient_row_format.dart';
import 'patient_empty_value.dart';

/// Date of the newest consultation, or an em dash for first-time patients.
class PatientLastVisitCell extends StatelessWidget {
  const PatientLastVisitCell({super.key, this.date});

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final value = date;
    if (value == null) return const PatientEmptyValue();

    return ResponsiveText(
      PatientRowFormat.date(value, context),
      fontSize: Dimensions.FONT_SIZE_SMALL,
      color: context.clinicTextSecondary,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
