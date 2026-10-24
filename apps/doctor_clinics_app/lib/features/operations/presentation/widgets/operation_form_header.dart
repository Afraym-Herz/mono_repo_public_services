import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Header of the new-operation modal.
class OperationFormHeader extends StatelessWidget {
  const OperationFormHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_LARGE.h,
        Dimensions.PADDING_SIZE_SMALL.w,
        Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.ICON_SIZE_LARGE.r * 1.4,
            height: Dimensions.ICON_SIZE_LARGE.r * 1.4,
            decoration: BoxDecoration(
              color: context.clinicContainer,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
              border: Border.all(color: context.clinicBorder),
            ),
            child: Icon(
              Icons.medical_services_outlined,
              size: Dimensions.ICON_SIZE_DEFAULT.r,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'operation_form.title'.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.clinicTextPrimary,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
                Text(
                  'operation_form.subtitle'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.clinicTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onClose,
            tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }
}
