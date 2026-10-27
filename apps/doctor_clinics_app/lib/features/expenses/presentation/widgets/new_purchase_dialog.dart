import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/new_purchase_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/purchase_form_controller.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/new_purchase_view.dart';

/// Opens the supplier-bill modal and returns the saved purchase, if any.
Future<Purchase?> showNewPurchaseDialog(BuildContext context) {
  return showGeneralDialog<Purchase>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => BlocProvider(
      create: (_) => getIt<NewPurchaseCubit>(),
      child: const NewPurchaseDialog(),
    ),
  );
}

class NewPurchaseDialog extends StatefulWidget {
  const NewPurchaseDialog({super.key});

  @override
  State<NewPurchaseDialog> createState() => _NewPurchaseDialogState();
}

class _NewPurchaseDialogState extends State<NewPurchaseDialog> {
  late final PurchaseFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PurchaseFormController(repository: getIt());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPurchaseCubit, NewPurchaseState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeMap(
          saved: (value) => Navigator.pop(context, value.purchase),
          error: (value) => AppSnackBar.showError(context, value.message),
          orElse: () {},
        );
      },
      child: NewPurchaseView(
        controller: _controller,
        onClose: () => Navigator.pop(context),
        onSave: _save,
      ),
    );
  }

  void _save() {
    if (!_controller.formKey.currentState!.validate()) return;
    final amounts = _controller.totals;
    if (amounts.paid > amounts.total) {
      return _error('billing.invoice_form.paid_exceeds');
    }
    final draft = _controller.toDraft();
    if (draft == null) return _error('billing.purchase_form.item_required');
    context.read<NewPurchaseCubit>().save(draft);
  }

  void _error(String key) => AppSnackBar.showError(context, key.tr());
}
