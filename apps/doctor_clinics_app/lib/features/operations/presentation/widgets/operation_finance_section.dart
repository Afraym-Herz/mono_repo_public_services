import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_detail_block.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_money_row.dart';

/// Cost, paid deposit and remaining balance of one operation.
class OperationFinanceSection extends StatelessWidget {
  const OperationFinanceSection({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final paid = entry.operation.depositPiasters ?? 0;
    final total = entry.operation.totalCostPiasters ?? 0;
    return OperationDetailBlock(
      title: 'operations_board.finance.title'.tr(),
      icon: Icons.account_balance_wallet_outlined,
      child: Column(
        children: [
          OperationMoneyRow(
            label: 'operations_board.finance.cost'.tr(),
            value: OperationFormat.money(total, context),
            color: context.clinicTextPrimary,
          ),
          OperationMoneyRow(
            label: 'operations_board.finance.deposit'.tr(),
            value: OperationFormat.money(paid, context),
            color: context.clinicStatusDone,
          ),
          Divider(
            height: Dimensions.PADDING_SIZE_SMALL.h,
            color: context.clinicBorder,
          ),
          OperationMoneyRow(
            label: 'operations_board.finance.remaining'.tr(),
            value: OperationFormat.money(entry.balancePiasters, context),
            color: entry.hasBalance
                ? context.clinicActionDanger
                : context.clinicStatusDone,
            emphasized: true,
          ),
        ],
      ),
    );
  }
}
