import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    toolbarHeight: AppSizes.appBarHeight,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    titleSpacing: AppSizes.xs,
    backgroundColor: AppColors.primary,
    surfaceTintColor: Colors.white,
    iconTheme: IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.textWhite,
        fontFamily: AppTexts.primaryFontFamily),
  );
  static const darkAppBarTheme = AppBarTheme(
    toolbarHeight: AppSizes.appBarHeight,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    titleSpacing: AppSizes.xs,
    backgroundColor: AppColors.dark,
    surfaceTintColor: AppColors.dark,
    iconTheme: IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: AppTexts.primaryFontFamily),
  );
}
