import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/new_invoice_draft.dart';

part 'new_invoice_state.dart';
part 'new_invoice_cubit.freezed.dart';

/// Persists one invoice, its service items and the optional down-payment.
class NewInvoiceCubit extends Cubit<NewInvoiceState> {
  NewInvoiceCubit({required this.repository})
    : super(const NewInvoiceState.initial());

  final IBillingRepository repository;

  Future<void> save(NewInvoiceDraft draft) async {
    if (state.maybeMap(saving: (_) => true, orElse: () => false)) return;
    emit(const NewInvoiceState.saving());

    final invoice = await _createInvoice(draft.invoice);
    if (isClosed || invoice == null) return;
    if (!await _addItems(invoice.id, draft.items)) return;
    if (!await _addPayment(invoice, draft)) return;
    if (!isClosed) emit(NewInvoiceState.saved(invoice: invoice));
  }

  Future<Invoice?> _createInvoice(Invoice invoice) async {
    final result = await repository.createInvoice(invoice);
    if (isClosed) return null;
    return result.fold((failure) {
      emit(NewInvoiceState.error(message: failure.message));
      return null;
    }, (created) => created);
  }

  Future<bool> _addItems(int invoiceId, List<InvoiceItem> items) async {
    for (final item in items) {
      final result = await repository.addInvoiceItem(
        item.copyWith(invoiceId: invoiceId),
      );
      if (isClosed) return false;
      final failure = result.fold((error) => error.message, (_) => null);
      if (failure != null) {
        emit(NewInvoiceState.error(message: failure));
        return false;
      }
    }
    return true;
  }

  Future<bool> _addPayment(Invoice invoice, NewInvoiceDraft draft) async {
    if (draft.paidPiasters <= 0) return true;
    final receiptResult = await repository.nextReceiptNumber();
    if (isClosed) return false;

    String? receipt;
    String? error;
    receiptResult.fold(
      (failure) => error = failure.message,
      (number) => receipt = number,
    );
    final receiptNumber = receipt;
    if (receiptNumber == null) {
      emit(NewInvoiceState.error(message: error ?? 'billing.error.save'));
      return false;
    }

    final result = await repository.recordPayment(
      Payment(
        id: 0,
        invoiceId: invoice.id,
        patientId: invoice.patientId,
        receiptNumber: receiptNumber,
        amountPiasters: draft.paidPiasters,
        paymentMethod: draft.paymentMethod,
        paymentDate: invoice.invoiceDate,
        createdBy: 0,
        createdAt: DateTime.now(),
      ),
    );
    if (isClosed) return false;
    final failure = result.fold((value) => value.message, (_) => null);
    if (failure != null) {
      emit(NewInvoiceState.error(message: failure));
      return false;
    }
    return true;
  }
}
