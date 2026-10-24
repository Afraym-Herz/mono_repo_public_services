import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Quick actions on the operations banner.
///
/// Secondary navigation and backup lead, and the filled "new operation" pill
/// trails so the primary action lands on the leading edge in RTL.
class OperationHeaderActions extends StatelessWidget {
  const OperationHeaderActions({
    super.key,
    required this.onDashboard,
    required this.onBackup,
    required this.onNewOperation,
  });

  final VoidCallback onDashboard;
  final VoidCallback onBackup;
  final VoidCallback onNewOperation;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      children: [
        AppPillButton(
          icon: Icons.dashboard_outlined,
          label: 'operations_board.header.dashboard'.tr(),
          onTap: onDashboard,
        ),
        AppPillButton(
          icon: Icons.backup_outlined,
          label: 'operations_board.header.backup'.tr(),
          onTap: onBackup,
        ),
        AppPillButton(
          icon: Icons.add_rounded,
          label: 'operations_board.header.new_operation'.tr(),
          onTap: onNewOperation,
          primary: true,
        ),
      ],
    );
  }
}
