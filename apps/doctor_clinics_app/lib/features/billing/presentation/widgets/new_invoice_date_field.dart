import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/invoice_form_controller.dart';

/// Invoice date selector shown under the patient step.
class NewInvoiceDateField extends StatelessWidget {
  const NewInvoiceDateField({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: controller.date,
      builder: (context, value, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'billing.invoice_form.date'.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: context.clinicTextSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          AppButton(
            label: DateConverter.localizedFullDate(
              value,
              context.locale.toString(),
            ),
            icon: Icons.calendar_month_outlined,
            outlined: true,
            height: Dimensions.CONTROL_HEIGHT.h,
            onPressed: () => _pick(context),
          ),
        ],
      ),
    );
  }

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: controller.date.value,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );
    if (picked != null) {
      controller.date.value = DateTime(picked.year, picked.month, picked.day);
    }
  }
}
