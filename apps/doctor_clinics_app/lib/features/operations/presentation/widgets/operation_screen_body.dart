import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_board_content.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_error_state.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_header_connected.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_loading_state.dart';

/// Operations workspace: shared banner plus the loading/error/board canvas.
class OperationScreenBody extends StatelessWidget {
  const OperationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const OperationHeaderConnected(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_SMALL.h,
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_LARGE.h,
              ),
              child: BlocBuilder<OperationBoardCubit, OperationBoardState>(
                builder: (context, state) => state.maybeMap(
                  loaded: (loaded) => OperationBoardContent(state: loaded),
                  error: (error) => OperationErrorState(
                    message: error.message,
                    onRetry: context.read<OperationBoardCubit>().load,
                  ),
                  loading: (_) => const OperationLoadingState(),
                  orElse: () => const OperationLoadingState(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
