import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

part 'billing_state.dart';
part 'billing_cubit.freezed.dart';

class BillingCubit extends Cubit<BillingState> {
  final IBillingRepository repository;

  BillingCubit({required this.repository})
      : super(const BillingState.initial());

  Future<void> loadInvoices() async {
    emit(const BillingState.loading());
    final result = await repository.getAllInvoices();
    result.fold(
      (failure) => emit(BillingState.error(message: failure.message)),
      (invoices) => emit(BillingState.loaded(invoices: invoices)),
    );
  }

  Future<void> loadByPatient(int patientId) async {
    emit(const BillingState.loading());
    final result = await repository.getByPatient(patientId);
    result.fold(
      (failure) => emit(BillingState.error(message: failure.message)),
      (invoices) => emit(BillingState.loaded(invoices: invoices)),
    );
  }

  Future<void> loadInvoiceDetail(int invoiceId) async {
    emit(const BillingState.loading());
    final invoicesResult = await repository.getAllInvoices();
    final itemsResult = await repository.getInvoiceItems(invoiceId);
    final paymentsResult = await repository.getPayments(invoiceId);

    final invoices = invoicesResult.fold((_) => <Invoice>[], (i) => i);
    final invoice = invoices.cast<Invoice?>().firstWhere(
          (inv) => inv?.id == invoiceId,
          orElse: () => null,
        );

    if (invoice == null) {
      emit(const BillingState.error(message: 'Invoice not found'));
      return;
    }

    final items = itemsResult.fold((_) => <InvoiceItem>[], (i) => i);
    final payments = paymentsResult.fold((_) => <Payment>[], (p) => p);

    emit(
      BillingState.invoiceDetail(
        invoice: invoice,
        items: items,
        payments: payments,
      ),
    );
  }

  Future<void> createInvoice(Invoice invoice) async {
    emit(const BillingState.loading());
    final result = await repository.createInvoice(invoice);
    result.fold(
      (failure) => emit(BillingState.error(message: failure.message)),
      (_) => loadInvoices(),
    );
  }

  Future<void> addItem(InvoiceItem item) async {
    final result = await repository.addInvoiceItem(item);
    result.fold(
      (failure) => emit(BillingState.error(message: failure.message)),
      (_) => loadInvoiceDetail(item.invoiceId),
    );
  }

  Future<void> recordPayment(Payment payment) async {
    emit(const BillingState.loading());
    final result = await repository.recordPayment(payment);
    result.fold(
      (failure) => emit(BillingState.error(message: failure.message)),
      (_) => loadInvoiceDetail(payment.invoiceId),
    );
  }

  Future<void> addExpense(Expense expense) async {
    await repository.addExpense(expense);
  }
}