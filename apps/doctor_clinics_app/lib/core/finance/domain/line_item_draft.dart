import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/core/helpers/money_input.dart';

/// One editable service line of the new-invoice form.
class FinanceLineItemDraft {
  FinanceLineItemDraft({required this.onChanged}) {
    description.addListener(onChanged);
    quantity.addListener(onChanged);
    unitPrice.addListener(onChanged);
  }

  final VoidCallback onChanged;
  final TextEditingController description = TextEditingController();
  final TextEditingController quantity = TextEditingController(text: '1');
  final TextEditingController unitPrice = TextEditingController();

  int? get quantityValue => int.tryParse(quantity.text.trim());

  int? get unitPricePiasters => MoneyInput.tryParsePiasters(unitPrice.text);

  int get totalPiasters {
    final count = quantityValue;
    final price = unitPricePiasters;
    if (count == null || price == null || count <= 0 || price <= 0) return 0;
    return count * price;
  }

  bool get isValid =>
      description.text.trim().isNotEmpty &&
      (quantityValue ?? 0) > 0 &&
      (unitPricePiasters ?? 0) > 0;

  void dispose() {
    description.removeListener(onChanged);
    quantity.removeListener(onChanged);
    unitPrice.removeListener(onChanged);
    description.dispose();
    quantity.dispose();
    unitPrice.dispose();
  }
}
