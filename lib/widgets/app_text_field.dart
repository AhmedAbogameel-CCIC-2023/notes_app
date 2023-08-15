import 'package:flutter/material.dart';

import '../core/app_colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.cursorHeight = 28,
    this.hintFontSize = 24,
  });

  final String hint;
  final double cursorHeight;
  final double hintFontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.white,
      cursorHeight: cursorHeight,
      keyboardAppearance: Brightness.dark,
      style: TextStyle(
        color: AppColors.white,
        fontSize: hintFontSize,
      ),
      maxLines: null,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hint,

        hintStyle: TextStyle(
          color: AppColors.gray,
          fontSize: hintFontSize,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
