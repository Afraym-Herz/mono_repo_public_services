import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_entry_lookup.dart';
import 'package:doctor_clinics_app/features/operations/presentation/screens/operation_form_screen.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_error_state.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_loading_state.dart';

/// Barrier-backed host for the edit-operation form.
///
/// Resolves the row from its own board copy first, so the form opens with the
/// current record (and its checklist) instead of a stale snapshot.
class OperationEditScreen extends StatelessWidget {
  const OperationEditScreen({super.key, required this.operationId});

  final int operationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OperationBoardCubit>()..load(),
      child: BlocBuilder<OperationBoardCubit, OperationBoardState>(
        builder: (context, state) {
          final entry = findOperationEntry(state, operationId);
          if (entry != null) return OperationFormScreen(entry: entry);
          final loading = state.maybeMap(
            initial: (_) => true,
            loading: (_) => true,
            orElse: () => false,
          );
          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: loading
                ? const OperationLoadingState()
                : Center(
                    child: OperationErrorState(
                      message: state.maybeMap(
                        error: (error) => error.message,
                        orElse: () => 'operations_board.details.missing'.tr(),
                      ),
                      onRetry: () =>
                          context.read<OperationBoardCubit>().load(),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
