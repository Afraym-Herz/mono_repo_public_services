import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

import 'billing_form_header.dart';

/// Opens the inline supplier form and returns the created vendor, if any.
Future<Vendor?> showNewVendorDialog(BuildContext context) {
  return showDialog<Vendor>(
    context: context,
    barrierColor: AppColors.scrim,
    builder: (_) => const NewVendorDialog(),
  );
}

class NewVendorDialog extends StatefulWidget {
  const NewVendorDialog({super.key});

  @override
  State<NewVendorDialog> createState() => _NewVendorDialogState();
}

class _NewVendorDialogState extends State<NewVendorDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_LARGE.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
        side: BorderSide(color: context.clinicBorder),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BillingFormHeader(
              icon: Icons.add_business_outlined,
              titleKey: 'billing.vendor_form.title',
              subtitleKey: 'billing.vendor_form.subtitle',
              onClose: () => Navigator.pop(context),
            ),
            Flexible(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    Dimensions.PADDING_SIZE_LARGE.w,
                    0,
                    Dimensions.PADDING_SIZE_LARGE.w,
                    Dimensions.PADDING_SIZE_LARGE.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextField(
                        controller: _name,
                        label: 'billing.vendor_form.name'.tr(),
                        hint: 'billing.vendor_form.name_hint'.tr(),
                        prefixIcon: Icons.storefront_outlined,
                        validator: AppValidators.required,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                      AppTextField(
                        controller: _phone,
                        label: 'billing.vendor_form.phone'.tr(),
                        hint: 'billing.vendor_form.phone_hint'.tr(),
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                      AppTextField(
                        controller: _notes,
                        label: 'billing.vendor_form.notes'.tr(),
                        hint: 'billing.vendor_form.notes_hint'.tr(),
                        prefixIcon: Icons.notes_outlined,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_SMALL.h,
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_LARGE.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'billing.invoice_form.cancel'.tr(),
                      outlined: true,
                      height: Dimensions.CONTROL_HEIGHT.h,
                      onPressed: _saving
                          ? null
                          : () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                  Expanded(
                    flex: 2,
                    child: AppButton(
                      label: 'billing.vendor_form.save'.tr(),
                      icon: Icons.save_outlined,
                      height: Dimensions.CONTROL_HEIGHT.h,
                      isLoading: _saving,
                      onPressed: _saving ? null : _save,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final result = await getIt<IBillingRepository>().addVendor(
      Vendor(
        id: 0,
        name: _name.text.trim(),
        phone: _optional(_phone.text),
        notes: _optional(_notes.text),
        createdAt: DateTime.now(),
      ),
    );
    if (!mounted) return;
    result.fold(
      (failure) {
        setState(() => _saving = false);
        AppSnackBar.showError(context, failure.message);
      },
      (vendor) => Navigator.pop(context, vendor),
    );
  }

  String? _optional(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
