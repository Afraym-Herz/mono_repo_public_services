import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Desktop split of the operations board: list on the leading side, context
/// sidebar on the trailing side. Narrow widths stack the sidebar underneath.
class OperationBoardLayout extends StatelessWidget {
  const OperationBoardLayout({
    super.key,
    required this.main,
    required this.sidebar,
  });

  final Widget main;
  final Widget sidebar;

  @override
  Widget build(BuildContext context) {
    if (!context.isLargeTabletOrDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [main, sidebar],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: main),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        SizedBox(width: Dimensions.SIDE_NAV_WIDTH.w * 1.35, child: sidebar),
      ],
    );
  }
}
