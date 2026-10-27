import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_invoice_loader.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'record_payment_state.dart';
part 'record_payment_cubit.freezed.dart';

/// Loads the invoice being paid and records one receipt against it.
class RecordPaymentCubit extends Cubit<RecordPaymentState> {
  RecordPaymentCubit({
    required this.repository,
    required this.patientRepository,
  }) : super(const RecordPaymentState());

  final IBillingRepository repository;
  final PatientRepository patientRepository;

  Future<void> load(int invoiceId) async {
    emit(state.copyWith(loading: true, error: null));
    final load = await loadBillingInvoiceDetail(
      repository: repository,
      patientRepository: patientRepository,
      invoiceId: invoiceId,
    );
    if (isClosed) return;
    final detail = load.detail;
    emit(
      state.copyWith(
        loading: false,
        detail: detail,
        error: detail == null ? (load.error ?? 'billing.error.load') : null,
      ),
    );
  }

  Future<void> record({
    required int invoiceId,
    required int amountPiasters,
    required String paymentMethod,
    required DateTime date,
    String? notes,
  }) async {
    final detail = state.detail;
    if (detail == null || state.saving) return;
    emit(state.copyWith(saving: true, error: null));

    final receipt = await repository.nextReceiptNumber();
    final number = receipt.getOrElse(() => '');
    if (isClosed) return;
    if (number.isEmpty) {
      emit(state.copyWith(saving: false, error: 'billing.error.save'));
      return;
    }

    final result = await repository.recordPayment(
      Payment(
        id: 0,
        invoiceId: invoiceId,
        patientId: detail.invoice.patientId,
        receiptNumber: number,
        amountPiasters: amountPiasters,
        paymentMethod: paymentMethod,
        paymentDate: date,
        notes: notes,
        createdBy: 0,
        createdAt: DateTime.now(),
      ),
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(saving: false, error: failure.message)),
      (payment) => emit(state.copyWith(saving: false, saved: payment)),
    );
  }

  void clearError() {
    if (state.error != null) emit(state.copyWith(error: null));
  }
}
