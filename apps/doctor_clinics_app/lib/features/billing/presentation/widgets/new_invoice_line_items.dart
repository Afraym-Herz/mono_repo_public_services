import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/invoice_form_controller.dart';
import 'new_invoice_line_item_row.dart';

/// Editable service lines plus the add-row action.
class NewInvoiceLineItems extends StatelessWidget {
  const NewInvoiceLineItems({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'billing.invoice_form.services'.tr(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: context.clinicTextSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        ValueListenableBuilder<int>(
          valueListenable: controller.linesRevision,
          builder: (context, _, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var index = 0; index < controller.lines.length; index++) ...[
                NewInvoiceLineItemRow(
                  key: ObjectKey(controller.lines[index]),
                  controller: controller,
                  line: controller.lines[index],
                ),
                if (index < controller.lines.length - 1)
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              ],
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton.icon(
                  onPressed: controller.addLine,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: Text('billing.invoice_form.add_service'.tr()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
