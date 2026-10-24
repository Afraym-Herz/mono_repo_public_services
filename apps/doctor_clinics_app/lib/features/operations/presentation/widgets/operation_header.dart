import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'operation_header_actions.dart';
import 'operation_header_info.dart';

/// Banner above the operations board: identity on the leading edge, quick
/// actions on the trailing edge.
class OperationHeader extends StatelessWidget {
  const OperationHeader({
    super.key,
    required this.operationCount,
    required this.onDashboard,
    required this.onBackup,
    required this.onNewOperation,
  });

  final int operationCount;
  final VoidCallback onDashboard;
  final VoidCallback onBackup;
  final VoidCallback onNewOperation;

  @override
  Widget build(BuildContext context) {
    final info = OperationHeaderInfo(operationCount: operationCount);
    final actions = OperationHeaderActions(
      onDashboard: onDashboard,
      onBackup: onBackup,
      onNewOperation: onNewOperation,
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
