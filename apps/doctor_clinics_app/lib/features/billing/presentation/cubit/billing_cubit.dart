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
    // TODO: implement.
  }

  Future<void> loadByPatient(int patientId) async {
    // TODO: implement.
  }

  Future<void> loadInvoiceDetail(int invoiceId) async {
    // TODO: implement.
  }

  Future<void> createInvoice(Invoice invoice) async {
    // TODO: implement.
  }

  Future<void> addItem(InvoiceItem item) async {
    // TODO: implement.
  }

  Future<void> recordPayment(Payment payment) async {
    // TODO: implement.
  }

  Future<void> addExpense(Expense expense) async {
    // TODO: implement.
  }
}