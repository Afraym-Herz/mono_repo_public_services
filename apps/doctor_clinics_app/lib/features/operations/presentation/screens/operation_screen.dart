import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_screen_body.dart';

/// Lists the surgical operations with preparation checks, patient context,
/// financials and the current week at a glance.
class OperationScreen extends StatelessWidget {
  const OperationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OperationBoardCubit>()..load(),
      child: AdaptiveLayout(
        mobileLayout: (_) => const OperationScreenBody(),
        tabletLayout: (_) => const OperationScreenBody(),
        desktopLayout: (_) => const OperationScreenBody(),
      ),
    );
  }
}
