import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_summary.dart';

/// Operation row: a summary strip that opens the details modal on tap.
class OperationCard extends StatelessWidget {
  const OperationCard({
    super.key,
    required this.entry,
    required this.onOpenDetails,
  });

  final OperationEntry entry;
  final VoidCallback onOpenDetails;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r);
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: radius,
        border: Border.all(color: context.clinicBorder),
      ),
      child: OperationCardSummary(
        entry: entry,
        onOpen: onOpenDetails,
        radius: radius,
      ),
    );
  }
}
