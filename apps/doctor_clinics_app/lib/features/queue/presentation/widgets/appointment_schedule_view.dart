import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';
import 'appointment_day_list.dart';
import 'appointment_month_view.dart';
import 'appointment_week_list.dart';

class AppointmentScheduleView extends StatelessWidget {
  const AppointmentScheduleView({super.key, required this.canManage});

  final bool canManage;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentCubit>();
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                AppButton(
                  label: 'appointment_error.retry'.tr(),
                  icon: Icons.refresh_rounded,
                  width: 180.w,
                  onPressed: cubit.load,
                ),
              ],
            ),
          ),
        ),
        loaded: (mode, anchor, appointments, _, _, _, _) {
          if (mode == AppointmentViewMode.month) {
            return AppointmentMonthView(
              anchor: anchor,
              items: appointments,
              onDaySelected: (day) =>
                  cubit.load(mode: AppointmentViewMode.day, anchor: day),
            );
          }
          if (mode == AppointmentViewMode.week) {
            return AppointmentWeekList(
              anchor: anchor,
              items: appointments,
              canManage: canManage,
            );
          }
          return AppointmentDayList(
            anchor: AppointmentCalendar.dayOf(anchor),
            items: appointments,
            canManage: canManage,
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
