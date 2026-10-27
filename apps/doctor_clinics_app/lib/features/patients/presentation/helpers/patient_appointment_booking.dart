import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_list_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/schedule_permissions.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_booking_dialog.dart';

/// Opens the booking sheet from the patients screen and books the draft.
///
/// Pass [patient] to pre-select them (what a row/suggestion tap does), or
/// nothing for the "Book new appointment" tile — the sheet then offers its
/// own "New patient" action. Set [clearSearch] to `false` when opening from a
/// table row so the active toolbar query is preserved.
Future<void> bookAppointmentFromSearch(
  BuildContext context, {
  Patient? patient,
  bool clearSearch = true,
}) async {
  if (!canManageSchedule()) {
    AppSnackBar.showInfo(context, 'patients.book_forbidden'.tr());
    return;
  }

  // The dropdown floats on the app overlay; close it before the sheet.
  context.read<PatientToolbarCubit>().dismissSuggestions();

  final draft = await showAppointmentBookingDialog(
    context,
    initialPatient: patient,
  );
  if (draft == null || !context.mounted) return;

  final cubit = context.read<AppointmentCubit>();

  // The planner books from its `loaded` state only, and the patients screen
  // never runs it — a cold cubit has to be loaded before the first booking.
  if (cubit.state.maybeMap(loaded: (_) => false, orElse: () => true)) {
    await cubit.load(anchor: draft.date);
    if (!context.mounted) return;
  }

  await cubit.book(
    patientId: draft.patientId,
    date: draft.date,
    type: draft.type,
    reason: draft.reason,
    notes: draft.notes,
    depositPiasters: draft.depositPiasters,
  );
  if (!context.mounted) return;

  _reportBooking(
    context,
    cubit,
    draft.patientId,
    patient?.fullName,
    clearSearch: clearSearch,
  );
}

/// Tells the user how the booking went.
void _reportBooking(
  BuildContext context,
  AppointmentCubit cubit,
  int patientId,
  String? fallbackName, {
  required bool clearSearch,
}) {
  final state = cubit.state;
  final error = state.maybeMap(
    loaded: (loaded) => loaded.actionError,
    orElse: () => null,
  );
  final booked =
      error == null && state.maybeMap(loaded: (_) => true, orElse: () => false);

  if (!booked) {
    AppSnackBar.showError(context, (error ?? 'patients.book_error').tr());
    return;
  }

  if (clearSearch) context.read<PatientToolbarCubit>().clearQuery();
  final name = fallbackName ?? _patientName(context, patientId);
  AppSnackBar.showSuccess(
    context,
    name == null
        ? 'patients.book_success_generic'.tr()
        : 'patients.book_success'.tr(namedArgs: {'name': name}),
  );
}

/// Name of the booked patient when it is not one of the register's rows.
String? _patientName(BuildContext context, int patientId) {
  final rows = context.read<PatientListCubit>().state.maybeMap(
    loaded: (loaded) => loaded.rows,
    orElse: () => const <PatientListRow>[],
  );
  for (final row in rows) {
    if (row.patient.id == patientId) return row.patient.fullName;
  }
  return null;
}
