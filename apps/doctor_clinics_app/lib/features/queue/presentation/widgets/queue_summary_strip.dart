import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/queue_cubit.dart';
import '../helpers/queue_summary_data.dart';
import 'queue_summary_current_card.dart';
import 'queue_summary_stats_card.dart';
import 'queue_summary_total_card.dart';

/// Summary strip docked above the queue list: status counts, today's
/// registrations and the patient currently in consultation.
class QueueSummaryStrip extends StatelessWidget {
  const QueueSummaryStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueueCubit, QueueState>(
      builder: (context, state) {
        final isLoaded = state.maybeMap(
          loaded: (_) => true,
          orElse: () => false,
        );
        if (!isLoaded) return const SizedBox.shrink();

        final data = QueueSummaryData.fromBoard(tickets: state.allTickets);
        final doctorName = context.locale.languageCode == AppConstants.printLanguageAr
            ? state.doctorNameAr
            : (state.doctorNameEn.isEmpty
                  ? state.doctorNameAr
                  : state.doctorNameEn);
        final cards = [
          QueueSummaryCurrentCard(ticket: data.current, doctorName: doctorName),
          QueueSummaryTotalCard(data: data),
          QueueSummaryStatsCard(data: data),
        ];

        return FadeInUp(
          duration: const Duration(milliseconds: 350),
          child: context.isMobileOrSmallTablet
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _stacked(cards),
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 5, child: cards[0]),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                      Expanded(flex: 4, child: cards[1]),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                      Expanded(flex: 5, child: cards[2]),
                    ],
                  ),
                ),
        );
      },
    );
  }

  List<Widget> _stacked(List<Widget> cards) => [
    cards[0],
    SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
    cards[1],
    SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
    cards[2],
  ];
}
