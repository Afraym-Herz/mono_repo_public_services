import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_line_draft.dart';

import 'billing_line_item_row.dart';

/// Editable line items plus the add-row action, shared by billing forms.
class BillingLineItems extends StatelessWidget {
  const BillingLineItems({
    super.key,
    required this.lines,
    required this.revision,
    required this.onAdd,
    required this.onRemove,
    required this.titleKey,
    required this.addLabelKey,
    required this.descriptionLabelKey,
    required this.descriptionHintKey,
    required this.priceLabelKey,
  });

  final List<InvoiceLineDraft> lines;
  final ValueListenable<int> revision;
  final VoidCallback onAdd;
  final ValueChanged<InvoiceLineDraft> onRemove;
  final String titleKey;
  final String addLabelKey;
  final String descriptionLabelKey;
  final String descriptionHintKey;
  final String priceLabelKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          titleKey.tr(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: context.clinicTextSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        ValueListenableBuilder<int>(
          valueListenable: revision,
          builder: (context, _, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var index = 0; index < lines.length; index++) ...[
                BillingLineItemRow(
                  key: ObjectKey(lines[index]),
                  line: lines[index],
                  canRemove: lines.length > 1,
                  onRemove: () => onRemove(lines[index]),
                  descriptionLabelKey: descriptionLabelKey,
                  descriptionHintKey: descriptionHintKey,
                  priceLabelKey: priceLabelKey,
                ),
                if (index < lines.length - 1)
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              ],
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton.icon(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: Text(addLabelKey.tr()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
