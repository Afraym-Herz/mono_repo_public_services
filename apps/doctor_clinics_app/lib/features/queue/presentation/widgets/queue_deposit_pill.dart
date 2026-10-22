import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/queue_format.dart';

/// Shows the deposit the patient paid when the booking was made.
class QueueDepositPill extends StatelessWidget {
  const QueueDepositPill({super.key, required this.depositPiasters});

  final int depositPiasters;

  @override
  Widget build(BuildContext context) {
    final money = QueueFormat.money(depositPiasters, context);
    final text = '${'queue_row.meta.deposit'.tr()} — $money';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicInset,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: Dimensions.FONT_SIZE_SMALL.sp,
            color: context.clinicAccent,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: context.clinicAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
