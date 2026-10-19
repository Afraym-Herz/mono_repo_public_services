import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_section_detail_row.dart';

/// Detail lines under the operations highlight tile: how many procedures are
/// scheduled and the ones still waiting on a confirmation.
class HomeOperationsDetails extends StatelessWidget {
  const HomeOperationsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeSectionDetailRow(
          icon: Icons.medical_information_outlined,
          label: 'home_operations_total'.tr(),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
        HomeSectionDetailRow(
          icon: Icons.notifications_active_outlined,
          label: 'home_operations_pending'.tr(),
          color: AppColors.warningDark,
          emphasized: true,
        ),
      ],
    );
  }
}
