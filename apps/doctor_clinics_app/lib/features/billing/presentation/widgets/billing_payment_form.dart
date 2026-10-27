import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/record_payment_cubit.dart';

import 'billing_payment_fields.dart';
import 'billing_payment_footer.dart';
import 'billing_payment_summary.dart';

/// Record-payment modal body: summary, inputs and save action.
class BillingPaymentForm extends StatefulWidget {
  const BillingPaymentForm({
    super.key,
    required this.detail,
    required this.saving,
  });

  final BillingInvoiceDetail detail;
  final bool saving;

  @override
  State<BillingPaymentForm> createState() => _BillingPaymentFormState();
}

class _BillingPaymentFormState extends State<BillingPaymentForm> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _notes = TextEditingController();
  final _method = ValueNotifier<String>(AppConstants.paymentMethodCash);
  final _date = ValueNotifier<DateTime>(DateTime.now());

  @override
  void dispose() {
    _amount.dispose();
    _notes.dispose();
    _method.dispose();
    _date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BillingPaymentSummary(detail: detail),
                  BillingPaymentFields(
                    amount: _amount,
                    notes: _notes,
                    method: _method,
                    date: _date,
                    duePiasters: detail.duePiasters,
                  ),
                ],
              ),
            ),
          ),
        ),
        BillingPaymentFooter(
          saving: widget.saving,
          onCancel: () => context.pop(false),
          onSave: _save,
        ),
      ],
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final piasters = MoneyInput.tryParsePiasters(_amount.text) ?? 0;
    final notes = _notes.text.trim();
    await context.read<RecordPaymentCubit>().record(
      invoiceId: widget.detail.invoice.id,
      amountPiasters: piasters,
      paymentMethod: _method.value,
      date: _date.value,
      notes: notes.isEmpty ? null : notes,
    );
  }
}
