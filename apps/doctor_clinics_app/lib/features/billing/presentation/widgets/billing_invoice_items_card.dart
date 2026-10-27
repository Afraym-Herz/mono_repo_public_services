import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'billing_detail_row.dart';

/// Read-only service lines of one invoice.
class BillingInvoiceItemsCard extends StatelessWidget {
  const BillingInvoiceItemsCard({super.key, required this.items});

  final List<InvoiceItem> items;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'billing.invoice_detail.items'.tr(),
      icon: Icons.list_alt_outlined,
      animationDelay: const Duration(milliseconds: 400),
      child: items.isEmpty
          ? ResponsiveText(
              'billing.invoice_detail.no_items'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
            )
          : Column(
              children: [
                for (final item in items)
                  BillingDetailRow(
                    label: item.description.isEmpty
                        ? 'billing.value.none'.tr()
                        : item.description,
                    value: FinanceFormat.money(item.totalPiasters, context),
                  ),
              ],
            ),
    );
  }
}
