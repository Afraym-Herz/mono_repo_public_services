import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/remember_me_cubit.dart';

/// Remember-me checkbox (start) + workstation badge (end).
class RememberWorkstationRow extends StatelessWidget {
  const RememberWorkstationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 300),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<RememberMeCubit, bool>(
              builder: (context, remember) {
                return InkWell(
                  onTap: () => context.read<RememberMeCubit>().toggle(),
                  borderRadius: BorderRadius.circular(
                    Dimensions.RADIUS_DEFAULT.r,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: Dimensions.ICON_SIZE_DEFAULT.r,
                        height: Dimensions.ICON_SIZE_DEFAULT.r,
                        child: Checkbox(
                          value: remember,
                          activeColor: context.clinicAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimensions.RADIUS_SMALL.r,
                            ),
                          ),
                          onChanged: (_) =>
                              context.read<RememberMeCubit>().toggle(),
                        ),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
                      Flexible(
                        child: Text(
                          'login_remember'.tr(),
                          style: TextStyle(
                            fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                            color: context.clinicTextPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
            ),
            child: Text(
              'login_workstation'.tr(),
              style: TextStyle(
                fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                fontWeight: FontWeight.w600,
                color: context.clinicAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
