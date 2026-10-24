import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/purchase_form_controller.dart';

import 'new_vendor_dialog.dart';

/// Supplier dropdown plus the inline "new supplier" action.
class NewPurchaseVendorField extends StatelessWidget {
  const NewPurchaseVendorField({super.key, required this.controller});

  final PurchaseFormController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller.revision,
      builder: (context, _, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'billing.purchase_form.supplier'.tr(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: context.clinicTextSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () => _addVendor(context),
                icon: const Icon(Icons.add_business_outlined, size: 18),
                label: Text('billing.purchase_form.new_supplier'.tr()),
              ),
            ],
          ),
          if (controller.vendorsLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: LinearProgressIndicator(minHeight: 2),
            )
          else
            AppDropdownField<Vendor>(
              label: 'billing.purchase_form.supplier'.tr(),
              hint: controller.vendorsError ??
                  'billing.purchase_form.supplier_hint'.tr(),
              prefixIcon: Icons.storefront_outlined,
              value: controller.vendor.value,
              items: [
                for (final vendor in controller.vendors)
                  DropdownMenuItem(
                    value: vendor,
                    child: Text(vendor.name),
                  ),
              ],
              onChanged: (value) => controller.vendor.value = value,
            ),
        ],
      ),
    );
  }

  Future<void> _addVendor(BuildContext context) async {
    final vendor = await showNewVendorDialog(context);
    if (vendor != null) controller.addVendor(vendor);
  }
}
