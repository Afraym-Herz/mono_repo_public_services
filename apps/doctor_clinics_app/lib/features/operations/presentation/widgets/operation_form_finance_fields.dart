import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_validators.dart';

/// Total cost and paid deposit, entered in EGP.
class OperationFormFinanceFields extends StatelessWidget {
  const OperationFormFinanceFields({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cost = _AmountField(
          controller: controller.cost,
          label: 'operation_form.cost'.tr(),
          icon: Icons.payments_outlined,
        );
        final deposit = _AmountField(
          controller: controller.deposit,
          label: 'operation_form.deposit'.tr(),
          icon: Icons.account_balance_wallet_outlined,
        );
        if (constraints.maxWidth < 420) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              cost,
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              deposit,
            ],
          );
        }
        return Row(
          children: [
            Expanded(child: cost),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(child: deposit),
          ],
        );
      },
    );
  }
}

class _AmountField extends StatelessWidget {
  const _AmountField({
    required this.controller,
    required this.label,
    required this.icon,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: label,
      hint: 'operation_form.amount_hint'.tr(),
      prefixIcon: icon,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.next,
      validator: OperationFormValidators.amount,
    );
  }
}
