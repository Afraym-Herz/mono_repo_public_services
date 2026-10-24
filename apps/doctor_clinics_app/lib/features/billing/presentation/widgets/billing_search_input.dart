import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Transparent input inside the billing search pill.
class BillingSearchInput extends StatelessWidget {
  const BillingSearchInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      cursorColor: context.clinicAccent,
      style: TextStyle(
        fontSize: Dimensions.FONT_SIZE_SMALL.sp,
        color: context.clinicTextPrimary,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintText: 'billing.search_hint'.tr(),
        hintStyle: TextStyle(
          fontSize: Dimensions.FONT_SIZE_SMALL.sp,
          color: context.clinicTextSecondary,
        ),
      ),
    );
  }
}
