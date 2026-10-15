import 'package:core/src/theme/dimensions.dart';
import 'package:core/src/utils/styles.dart';
import 'package:flutter/material.dart';

/// Title + description block for [CustomDialog] (see `logout_dialog.dart`).
class LogoutDialogBody extends StatelessWidget {
  const LogoutDialogBody({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: _titleStyle),
        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
        Text(description, textAlign: TextAlign.center, style: fontSizeRegular),
      ],
    );
  }

  TextStyle get _titleStyle => fontSizeRegular.copyWith(
        fontSize: Dimensions.FONT_SIZE_LARGE,
      );
}
