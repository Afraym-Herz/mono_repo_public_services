import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/patient_list_row.dart';
import '../cubit/patient_list_cubit.dart';
import '../cubit/patient_toolbar_cubit.dart';
import '../helpers/patient_appointment_booking.dart';
import 'patient_search_barrier.dart';
import 'patient_search_suggestions.dart';

/// Overlay content of the patient search: a dismiss barrier plus the floating
/// suggestion card anchored under the pill.
///
/// Inherited widgets stay reachable here because `OverlayPortal` builds the
/// overlay child inside the field's own subtree, so both cubits resolve.
class PatientSearchOverlay extends StatelessWidget {
  const PatientSearchOverlay({
    super.key,
    required this.width,
    required this.link,
  });

  /// Width of the search pill, so the card lines up with the field.
  final double width;

  /// Anchor shared with the pill's `CompositedTransformTarget`.
  final LayerLink link;

  @override
  Widget build(BuildContext context) {
    final query = context.select<PatientToolbarCubit, String>(
      (cubit) => cubit.state.query,
    );
    final rows = context.select<PatientListCubit, List<PatientListRow>?>(
      (cubit) => cubit.state.maybeMap(
        loaded: (loaded) => loaded.rows,
        orElse: () => null,
      ),
    );

    return SizedBox.expand(
      child: Stack(
        children: [
          const PatientSearchBarrier(),
          CompositedTransformFollower(
            link: link,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: Offset(0, Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            child: SizedBox(
              width: width,
              child: query.isEmpty || rows == null
                  ? const SizedBox.shrink()
                  : FadeInUp(
                      duration: const Duration(milliseconds: 160),
                      child: PatientSearchSuggestions(
                        rows: rows,
                        query: query.toLowerCase(),
                        onBook: (patient) => bookAppointmentFromSearch(
                          context,
                          patient: patient,
                        ),
                        onBookNew: () => bookAppointmentFromSearch(context),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
