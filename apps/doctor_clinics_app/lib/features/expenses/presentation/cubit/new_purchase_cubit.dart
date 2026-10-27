import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/new_purchase_draft.dart';

part 'new_purchase_state.dart';
part 'new_purchase_cubit.freezed.dart';

/// Persists one supplier bill, its items and the optional down-payment.
class NewPurchaseCubit extends Cubit<NewPurchaseState> {
  NewPurchaseCubit({required this.repository})
    : super(const NewPurchaseState.initial());

  final IExpensesRepository repository;

  Future<void> save(NewPurchaseDraft draft) async {
    if (state.maybeMap(saving: (_) => true, orElse: () => false)) return;
    emit(const NewPurchaseState.saving());

    final purchase = await _createPurchase(draft.purchase);
    if (isClosed || purchase == null) return;
    if (!await _addItems(purchase.id, draft.items)) return;
    if (!await _addPayment(purchase, draft)) return;
    if (!isClosed) emit(NewPurchaseState.saved(purchase: purchase));
  }

  Future<Purchase?> _createPurchase(Purchase purchase) async {
    final result = await repository.createPurchase(purchase);
    if (isClosed) return null;
    return result.fold((failure) {
      emit(NewPurchaseState.error(message: failure.message));
      return null;
    }, (created) => created);
  }

  Future<bool> _addItems(int purchaseId, List<PurchaseItem> items) async {
    for (final item in items) {
      final result = await repository.addPurchaseItem(
        item.copyWith(purchaseId: purchaseId),
      );
      if (isClosed) return false;
      final failure = result.fold((error) => error.message, (_) => null);
      if (failure != null) {
        emit(NewPurchaseState.error(message: failure));
        return false;
      }
    }
    return true;
  }

  Future<bool> _addPayment(
    Purchase purchase,
    NewPurchaseDraft draft,
  ) async {
    if (draft.paidPiasters <= 0) return true;
    final receiptResult = await repository.nextPurchaseReceiptNumber();
    if (isClosed) return false;

    String? receipt;
    String? error;
    receiptResult.fold(
      (failure) => error = failure.message,
      (number) => receipt = number,
    );
    final receiptNumber = receipt;
    if (receiptNumber == null) {
      emit(NewPurchaseState.error(message: error ?? 'billing.error.save'));
      return false;
    }

    final result = await repository.recordPurchasePayment(
      PurchasePayment(
        id: 0,
        purchaseId: purchase.id,
        vendorId: purchase.vendorId,
        receiptNumber: receiptNumber,
        amountPiasters: draft.paidPiasters,
        paymentMethod: draft.paymentMethod,
        paymentDate: purchase.purchaseDate,
        createdBy: 0,
        createdAt: DateTime.now(),
      ),
    );
    if (isClosed) return false;
    final failure = result.fold((value) => value.message, (_) => null);
    if (failure != null) {
      emit(NewPurchaseState.error(message: failure));
      return false;
    }
    return true;
  }
}
