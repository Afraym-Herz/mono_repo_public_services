import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'expenses_header_actions.dart';
import 'expenses_header_info.dart';

/// Banner docked under the workspace top bar on the expenses screen.
class ExpensesHeader extends StatelessWidget {
  const ExpensesHeader({
    super.key,
    required this.onExport,
    required this.onCreate,
  });

  final VoidCallback onExport;
  final ValueChanged<ExpensesCreateAction> onCreate;

  @override
  Widget build(BuildContext context) {
    final info = const ExpensesHeaderInfo();
    final actions = ExpensesHeaderActions(
      onExport: onExport,
      onCreate: onCreate,
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
