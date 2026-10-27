import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_details_panel.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_modal_shell.dart';

/// Barrier-backed host for the operation details.
///
/// Pushed with `transparentModalRoutePage(...)` (see CLAUDE.md §5) so the board
/// stays visible behind the scrim, and owns its own board copy so the actions
/// inside can mutate and refresh without touching the board behind it.
class OperationDetailsScreen extends StatelessWidget {
  const OperationDetailsScreen({super.key, required this.operationId});

  final int operationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OperationBoardCubit>()..load(),
      child: FinanceModalShell(
        child: OperationDetailsPanel(operationId: operationId),
      ),
    );
  }
}
