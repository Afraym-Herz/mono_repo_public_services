import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_invoice_loader.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'invoice_detail_state.dart';
part 'invoice_detail_cubit.freezed.dart';

/// Loads the read-only invoice modal and refreshes it after a payment.
class InvoiceDetailCubit extends Cubit<InvoiceDetailState> {
  InvoiceDetailCubit({
    required this.repository,
    required this.patientRepository,
  }) : super(const InvoiceDetailState.loading());

  final IBillingRepository repository;
  final PatientRepository patientRepository;

  Future<void> load(int invoiceId) async {
    emit(const InvoiceDetailState.loading());
    final load = await loadBillingInvoiceDetail(
      repository: repository,
      patientRepository: patientRepository,
      invoiceId: invoiceId,
    );
    if (isClosed) return;
    final detail = load.detail;
    emit(
      detail == null
          ? InvoiceDetailState.error(
              message: load.error ?? 'billing.error.load',
            )
          : InvoiceDetailState.loaded(detail: detail),
    );
  }
}
