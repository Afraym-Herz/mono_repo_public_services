import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/new_invoice_cubit.dart';

/// Cancel / save actions pinned below the new-invoice form.
class NewInvoiceFooter extends StatelessWidget {
  const NewInvoiceFooter({
    super.key,
    required this.onCancel,
    required this.onSave,
    this.saveLabelKey = 'billing.invoice_form.save',
  });

  final VoidCallback onCancel;
  final VoidCallback onSave;
  final String saveLabelKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewInvoiceCubit, NewInvoiceState>(
      builder: (context, state) {
        final saving = state.maybeMap(saving: (_) => true, orElse: () => false);
        return Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'billing.invoice_form.cancel'.tr(),
                outlined: true,
                height: Dimensions.CONTROL_HEIGHT.h,
                onPressed: saving ? null : onCancel,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              flex: 2,
              child: AppButton(
                label: saveLabelKey.tr(),
                icon: Icons.save_outlined,
                height: Dimensions.CONTROL_HEIGHT.h,
                isLoading: saving,
                onPressed: saving ? null : onSave,
              ),
            ),
          ],
        );
      },
    );
  }
}
