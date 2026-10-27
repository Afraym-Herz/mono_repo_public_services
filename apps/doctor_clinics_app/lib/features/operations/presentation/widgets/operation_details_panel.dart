import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_handlers.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_entry_lookup.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_details.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_error_state.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_loading_state.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_form_header.dart';

/// Header plus the live detail sections of the operation modal.
class OperationDetailsPanel extends StatelessWidget {
  const OperationDetailsPanel({super.key, required this.operationId});

  final int operationId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FinanceFormHeader(
          icon: Icons.medical_services_outlined,
          titleKey: 'operations_board.details.title',
          subtitleKey: 'operations_board.details.subtitle',
          onClose: () => context.pop(),
        ),
        Expanded(
          child: BlocBuilder<OperationBoardCubit, OperationBoardState>(
            builder: (context, state) {
              final entry = findOperationEntry(state, operationId);
              if (entry == null) {
                final loading = state.maybeMap(
                  initial: (_) => true,
                  loading: (_) => true,
                  orElse: () => false,
                );
                if (loading) return const OperationLoadingState();
                return Center(
                  child: OperationErrorState(
                    message: state.maybeMap(
                      error: (error) => error.message,
                      orElse: () =>
                          'operations_board.details.missing'.tr(),
                    ),
                    onRetry: () => context.read<OperationBoardCubit>().load(),
                  ),
                );
              }
              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  Dimensions.PADDING_SIZE_LARGE.w,
                  0,
                  Dimensions.PADDING_SIZE_LARGE.w,
                  Dimensions.PADDING_SIZE_LARGE.h,
                ),
                child: OperationCardDetails(
                  entry: entry,
                  onToggleTest: (test) =>
                      OperationBoardHandlers.toggleTest(context, entry, test),
                  onComplete: () =>
                      OperationBoardHandlers.complete(context, entry),
                  onCancel: () => OperationBoardHandlers.cancel(context, entry),
                  onEdit: () => OperationBoardHandlers.edit(context, entry),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
