import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Title and fields shared by the finish and collect payment dialogs.
class QueuePaymentForm extends StatelessWidget {
  const QueuePaymentForm({
    super.key,
    required this.isFinish,
    required this.deposit,
    required this.paidNow,
    required this.onConfirm,
  });

  final bool isFinish;
  final TextEditingController deposit;
  final TextEditingController paidNow;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final titleKey = isFinish
        ? 'queue_row.finish.title'
        : 'queue_row.collect.title';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          titleKey.tr(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.clinicTextPrimary,
          ),
        ),
        SizedBox(height: Dimensions.paddingSizeDefault.h),
        AppTextField(
          controller: deposit,
          label: 'queue_row.payment.deposit'.tr(),
          hint: '0',
          keyboardType: TextInputType.number,
          readOnly: true,
          prefixIcon: Icons.account_balance_wallet_outlined,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h),
        AppTextField(
          controller: paidNow,
          label: 'queue_row.payment.paid_now'.tr(),
          hint: 'queue_row.payment.optional_hint'.tr(),
          keyboardType: TextInputType.number,
          prefixIcon: Icons.payments_outlined,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
        AppButton(
          label: 'queue_row.payment.confirm'.tr(),
          onPressed: onConfirm,
          height: Dimensions.CONTROL_HEIGHT.h,
        ),
      ],
    );
  }
}
