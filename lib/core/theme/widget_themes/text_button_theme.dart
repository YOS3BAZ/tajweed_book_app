import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TTextButtonTheme {
  TTextButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightTextButtonTheme  = TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.secondary,
      disabledForegroundColor: AppColors.darkGrey,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
      textStyle: const TextStyle(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.bold, fontFamily: AppTexts.primaryFontFamily),
    ),
  );

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.light,
      disabledForegroundColor: AppColors.darkGrey,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 13, color: AppColors.textWhite, fontWeight: FontWeight.bold, fontFamily: AppTexts.primaryFontFamily),
    ),
  );
}
