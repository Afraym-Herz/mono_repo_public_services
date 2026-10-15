import 'package:core/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonVisible;
  final bool showDrawerButton;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButtonVisible = false,
    this.showDrawerButton = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).cardColor,
      actions: actions,
      leading: isBackButtonVisible
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Theme.of(context).primaryColor,
                  size: Dimensions.ICON_SIZE_DEFAULT.r,
                ),
              ),
            )
          : showDrawerButton
          ? Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
