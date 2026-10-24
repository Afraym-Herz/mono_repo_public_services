import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/new_invoice_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_form_controller.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/new_invoice_view.dart';

/// Opens the new-invoice / sale modal and returns the saved invoice, if any.
Future<Invoice?> showNewInvoiceDialog(
  BuildContext context, {
  InvoiceFormMode mode = InvoiceFormMode.patient,
}) {
  return showGeneralDialog<Invoice>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => BlocProvider(
      create: (_) => getIt<NewInvoiceCubit>(),
      child: NewInvoiceDialog(mode: mode),
    ),
  );
}

class NewInvoiceDialog extends StatefulWidget {
  const NewInvoiceDialog({super.key, this.mode = InvoiceFormMode.patient});

  final InvoiceFormMode mode;

  @override
  State<NewInvoiceDialog> createState() => _NewInvoiceDialogState();
}

class _NewInvoiceDialogState extends State<NewInvoiceDialog> {
  late final InvoiceFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = InvoiceFormController(mode: widget.mode);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewInvoiceCubit, NewInvoiceState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeMap(
          saved: (value) => Navigator.pop(context, value.invoice),
          error: (value) => AppSnackBar.showError(context, value.message),
          orElse: () {},
        );
      },
      child: NewInvoiceView(
        controller: _controller,
        mode: widget.mode,
        onClose: () => Navigator.pop(context),
        onSave: _save,
      ),
    );
  }

  void _save() {
    if (!_controller.formKey.currentState!.validate()) return;
    if (_controller.mode == InvoiceFormMode.patient &&
        _controller.patient.value == null) {
      return _error('billing.invoice_form.patient_required');
    }
    final amounts = _controller.totals;
    if (amounts.discount > amounts.subtotal) {
      return _error('billing.invoice_form.discount_exceeds');
    }
    if (amounts.paid > amounts.total) {
      return _error('billing.invoice_form.paid_exceeds');
    }
    final draft = _controller.toDraft();
    if (draft == null) return _error('billing.invoice_form.service_required');
    context.read<NewInvoiceCubit>().save(draft);
  }

  void _error(String key) => AppSnackBar.showError(context, key.tr());
}
