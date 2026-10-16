import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/remember_me_cubit.dart';

/// Remember-me checkbox driven by [RememberMeCubit] (no `setState`).
class RememberMeCheckbox extends StatelessWidget {
  const RememberMeCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RememberMeCubit, bool>(
      builder: (context, remember) {
        return InkWell(
          onTap: () => context.read<RememberMeCubit>().toggle(),
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
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
                child: ResponsiveText(
                  'login_remember'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: context.clinicTextPrimary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
