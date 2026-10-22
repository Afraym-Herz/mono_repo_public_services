import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/patient_list_cubit.dart';
import '../cubit/patient_toolbar_cubit.dart';

/// Transparent full-screen layer that closes the suggestion dropdown on any
/// tap outside the card.
///
/// Only claims hits once there is something to dismiss, so it never swallows
/// taps while the results are still loading.
class PatientSearchBarrier extends StatelessWidget {
  const PatientSearchBarrier({super.key});

  @override
  Widget build(BuildContext context) {
    final query = context.select<PatientToolbarCubit, String>(
      (cubit) => cubit.state.query,
    );
    final hasRows = context.select<PatientListCubit, bool>(
      (cubit) => cubit.state.maybeMap(loaded: (_) => true, orElse: () => false),
    );
    if (query.isEmpty || !hasRows) return const SizedBox.shrink();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: context.read<PatientToolbarCubit>().dismissSuggestions,
      child: const SizedBox.expand(),
    );
  }
}
