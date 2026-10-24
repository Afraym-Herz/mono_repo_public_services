import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/new_expense_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_date_field.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_form_header.dart';

/// Opens the operating-expense modal and returns the saved expense, if any.
Future<Expense?> showNewExpenseDialog(BuildContext context) {
  return showGeneralDialog<Expense>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => BlocProvider(
      create: (_) => getIt<NewExpenseCubit>()..load(),
      child: const NewExpenseDialog(),
    ),
  );
}

class NewExpenseDialog extends StatefulWidget {
  const NewExpenseDialog({super.key});

  @override
  State<NewExpenseDialog> createState() => _NewExpenseDialogState();
}

class _NewExpenseDialogState extends State<NewExpenseDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  final TextEditingController _newCategory = TextEditingController();
  final ValueNotifier<DateTime> _date = ValueNotifier(DateTime.now());
  int? _categoryId;

  @override
  void dispose() {
    _amount.dispose();
    _description.dispose();
    _notes.dispose();
    _newCategory.dispose();
    _date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewExpenseCubit, NewExpenseState>(
      listenWhen: (previous, current) =>
          previous.saved != current.saved || previous.error != current.error,
      listener: (context, state) {
        if (state.saved != null) {
          Navigator.pop(context, state.saved);
          return;
        }
        if (state.error != null) {
          AppSnackBar.showError(context, state.error!);
          context.read<NewExpenseCubit>().clearError();
        }
      },
      builder: (context, state) => Dialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: AppColors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_LARGE.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
          side: BorderSide(color: context.clinicBorder),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BillingFormHeader(
                icon: Icons.account_balance_wallet_outlined,
                titleKey: 'billing.expense_form.title',
                subtitleKey: 'billing.expense_form.subtitle',
                onClose: () => Navigator.pop(context),
              ),
              Flexible(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      Dimensions.PADDING_SIZE_LARGE.w,
                      0,
                      Dimensions.PADDING_SIZE_LARGE.w,
                      Dimensions.PADDING_SIZE_LARGE.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _categoryField(state),
                        if (_selectedCategory(state) == -1) ...[
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                          AppTextField(
                            controller: _newCategory,
                            label: 'billing.expense_form.category_name'.tr(),
                            hint: 'billing.expense_form.category_name_hint'.tr(),
                            prefixIcon: Icons.create_new_folder_outlined,
                            validator: AppValidators.required,
                          ),
                        ],
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                        AppTextField(
                          controller: _amount,
                          label: 'billing.expense_form.amount'.tr(),
                          hint: '0',
                          prefixIcon: Icons.payments_outlined,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (value) {
                            final piasters = MoneyInput.tryParsePiasters(
                              value ?? '',
                            );
                            return piasters == null || piasters <= 0
                                ? 'billing.expense_form.invalid_amount'.tr()
                                : null;
                          },
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                        BillingDateField(
                          date: _date,
                          labelKey: 'billing.expense_form.date',
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                        AppTextField(
                          controller: _description,
                          label: 'billing.expense_form.description'.tr(),
                          hint: 'billing.expense_form.description_hint'.tr(),
                          prefixIcon: Icons.description_outlined,
                          validator: AppValidators.required,
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                        AppTextField(
                          controller: _notes,
                          label: 'billing.expense_form.notes'.tr(),
                          hint: 'billing.expense_form.notes_hint'.tr(),
                          prefixIcon: Icons.notes_outlined,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimensions.PADDING_SIZE_LARGE.w,
                  Dimensions.PADDING_SIZE_SMALL.h,
                  Dimensions.PADDING_SIZE_LARGE.w,
                  Dimensions.PADDING_SIZE_LARGE.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'billing.invoice_form.cancel'.tr(),
                        outlined: true,
                        height: Dimensions.CONTROL_HEIGHT.h,
                        onPressed: state.saving
                            ? null
                            : () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                    Expanded(
                      flex: 2,
                      child: AppButton(
                        label: 'billing.expense_form.save'.tr(),
                        icon: Icons.save_outlined,
                        height: Dimensions.CONTROL_HEIGHT.h,
                        isLoading: state.saving,
                        onPressed: state.saving ? null : () => _save(state),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryField(NewExpenseState state) {
    if (state.loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: LinearProgressIndicator(minHeight: 2),
      );
    }
    final selected = _selectedCategory(state);
    return AppDropdownField<int>(
      label: 'billing.expense_form.category'.tr(),
      prefixIcon: Icons.category_outlined,
      value: selected,
      items: [
        for (final category in state.categories)
          DropdownMenuItem(value: category.id, child: Text(category.name)),
        DropdownMenuItem(
          value: -1,
          child: Text('billing.expense_form.new_category'.tr()),
        ),
      ],
      onChanged: (value) => setState(() => _categoryId = value),
    );
  }

  int _selectedCategory(NewExpenseState state) {
    final selected = _categoryId;
    if (selected != null) return selected;
    if (state.categories.isEmpty) return -1;
    return state.categories.first.id;
  }

  Future<void> _save(NewExpenseState state) async {
    if (!_formKey.currentState!.validate()) return;
    final amount = MoneyInput.tryParsePiasters(_amount.text) ?? 0;
    if (amount <= 0) {
      return _error('billing.expense_form.invalid_amount');
    }
    final cubit = context.read<NewExpenseCubit>();
    var categoryId = _selectedCategory(state);
    if (categoryId == -1) {
      final name = _newCategory.text.trim();
      if (name.isEmpty) {
        return _error('billing.expense_form.category_required');
      }
      final category = await cubit.createCategory(name);
      if (!mounted || category == null) return;
      categoryId = category.id;
    }
    await cubit.save(
      categoryId: categoryId,
      amountPiasters: amount,
      date: _date.value,
      description: _description.text.trim(),
      notes: _optional(_notes.text),
    );
  }

  void _error(String key) => AppSnackBar.showError(context, key.tr());

  String? _optional(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
