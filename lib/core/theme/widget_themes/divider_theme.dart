import 'package:flutter/material.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';

class TDividerTheme {
  TDividerTheme._();

  static DividerThemeData get lightDividerTheme => const DividerThemeData(
        color: AppColors.darkGrey,
        thickness: 0.0,
        indent: AppSizes.md,
        endIndent: AppSizes.md,
      );

  static DividerThemeData get darkDividerTheme => const DividerThemeData(
        color: AppColors.darkGrey,
        thickness: 0.0,
        indent: AppSizes.md,
        endIndent: AppSizes.md,
      );
}
