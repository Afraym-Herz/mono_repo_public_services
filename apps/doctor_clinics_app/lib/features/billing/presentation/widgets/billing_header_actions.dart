import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Documents the accounts screen can create.
enum BillingCreateAction { invoice, sale }

/// Export plus the create-document menu on the accounts banner.
class BillingHeaderActions extends StatefulWidget {
  const BillingHeaderActions({
    super.key,
    required this.onExport,
    required this.onCreate,
  });

  final VoidCallback onExport;
  final ValueChanged<BillingCreateAction> onCreate;

  @override
  State<BillingHeaderActions> createState() => _BillingHeaderActionsState();
}

class _BillingHeaderActionsState extends State<BillingHeaderActions> {
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
              BillingCreateAction.invoice,
              Icons.receipt_long_outlined,
              'billing.action.new_invoice',
            ),
            _item(
              BillingCreateAction.sale,
              Icons.point_of_sale_outlined,
              'billing.action.new_sale',
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

  Widget _item(BillingCreateAction action, IconData icon, String labelKey) {
    return MenuItemButton(
      leadingIcon: Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r),
      onPressed: () => widget.onCreate(action),
      child: Text(labelKey.tr()),
    );
  }
}
