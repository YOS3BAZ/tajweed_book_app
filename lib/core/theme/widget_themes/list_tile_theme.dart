import 'package:flutter/material.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';

class TListTileTheme {
  TListTileTheme._();

  static ListTileThemeData lightListTileTheme = ListTileThemeData(
    dense: true,
    horizontalTitleGap: 10,
    minVerticalPadding: AppSizes.md,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSizes.md * 0.8,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
    ),
    tileColor: Colors.white,
    style: ListTileStyle.list,
    // icons settings
    iconColor: AppColors.primary,
  );

  static ListTileThemeData darkListTileTheme = ListTileThemeData(
    dense: true,
    horizontalTitleGap: 10,
    minVerticalPadding: AppSizes.md,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSizes.md * 0.8,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
    ),
    tileColor: AppColors.darkContainer,
    style: ListTileStyle.list,
    // icons settings
    iconColor: AppColors.secondary,
  );
}
