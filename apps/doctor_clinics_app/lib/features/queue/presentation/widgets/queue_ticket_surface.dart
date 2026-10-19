import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/queue_row_state.dart';
import '../helpers/queue_row_style.dart';

class QueueTicketSurface extends StatelessWidget {
  const QueueTicketSurface({
    super.key,
    required this.rowState,
    required this.child,
    this.onTap,
  });

  final QueueRowState rowState;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = QueueRowStyle.forRowState(rowState);
    return Material(
      color: style.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        side: BorderSide(color: style.borderColor, width: 1.w),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.PADDING_SIZE_SMALL.h,
          ),
          child: child,
        ),
      ),
    );
  }
}
