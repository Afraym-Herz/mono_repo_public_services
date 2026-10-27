import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_overview_builder.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_source.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'billing_state.dart';
part 'billing_cubit.freezed.dart';

/// Loads the accounts read model and re-scopes it when the range changes.
///
/// The raw rows are cached in [BillingSource], so tapping another range pill
/// only rebuilds the overview instead of re-reading every table.
class BillingCubit extends Cubit<BillingState> {
  BillingCubit({required this.repository, required this.patientRepository})
    : super(const BillingState.initial());

  final IBillingRepository repository;
  final PatientRepository patientRepository;

  BillingSource? _source;
  FinanceRange _range = FinanceRange.month;
  int _request = 0;

  /// Rebuilds the overview for [range], fetching the snapshot when needed.
  Future<void> load({FinanceRange? range, bool force = false}) async {
    if (range != null) _range = range;
    final request = ++_request;

    if (_source == null || force) {
      emit(const BillingState.loading());
      _source = await BillingSourceLoader.load(
        repository: repository,
        patientRepository: patientRepository,
      );
    }
    if (request != _request || isClosed) return;

    final source = _source;
    if (source == null) {
      emit(const BillingState.error(message: 'billing.error.load'));
      return;
    }

    emit(
      BillingState.loaded(
        overview: BillingOverviewBuilder.build(
          range: _range,
          invoices: source.invoices,
          payments: source.payments,
          items: source.items,
          patientNames: source.patientNames,
          now: DateTime.now(),
        ),
      ),
    );
  }

  /// Re-reads the local database, discarding the cached snapshot.
  Future<void> refresh() => load(force: true);
}
