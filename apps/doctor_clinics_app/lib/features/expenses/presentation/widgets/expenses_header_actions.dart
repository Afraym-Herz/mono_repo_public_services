import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Documents the expenses screen can create.
enum ExpensesCreateAction { expense, purchase }

/// Export plus the create-document menu on the expenses banner.
class ExpensesHeaderActions extends StatefulWidget {
  const ExpensesHeaderActions({
    super.key,
    required this.onExport,
    required this.onCreate,
  });

  final VoidCallback onExport;
  final ValueChanged<ExpensesCreateAction> onCreate;

  @override
  State<ExpensesHeaderActions> createState() => _ExpensesHeaderActionsState();
}

class _ExpensesHeaderActionsState extends State<ExpensesHeaderActions> {
  final MenuController _menu = MenuController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      children: [
        AppPillButton(
          icon: Icons.file_download_outlined,
          label: 'billing.action.export'.tr(),
          onTap: widget.onExport,
          outlined: true,
        ),
        MenuAnchor(
          controller: _menu,
          alignmentOffset: const Offset(0, 8),
          menuChildren: [
            _item(
              ExpensesCreateAction.expense,
              Icons.account_balance_wallet_outlined,
              'billing.action.new_expense',
            ),
            _item(
              ExpensesCreateAction.purchase,
              Icons.shopping_bag_outlined,
              'billing.action.new_purchase',
            ),
          ],
          builder: (context, controller, child) => AppPillButton(
            icon: Icons.add_rounded,
            label: 'billing.action.new'.tr(),
            primary: true,
            onTap: () => controller.isOpen
                ? controller.close()
                : controller.open(),
          ),
        ),
      ],
    );
  }

  Widget _item(ExpensesCreateAction action, IconData icon, String labelKey) {
    return MenuItemButton(
      leadingIcon: Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r),
      onPressed: () => widget.onCreate(action),
      child: Text(labelKey.tr()),
    );
  }
}
