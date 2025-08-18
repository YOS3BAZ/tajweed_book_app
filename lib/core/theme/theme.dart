import 'package:flutter/material.dart';
import 'package:tajweed_book_app/core/theme/widget_themes/divider_theme.dart';
import 'package:tajweed_book_app/core/theme/widget_themes/list_tile_theme.dart';

import '../constants/colors.dart';
import '../constants/text_strings.dart';
import 'colors_scheme/custom_colors_scheme.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTexts.primaryFontFamily,
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    scaffoldBackgroundColor: AppColors.white,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    colorScheme: CustomColorsScheme.lightColorScheme,
    listTileTheme: TListTileTheme.lightListTileTheme,
    dividerTheme: TDividerTheme.lightDividerTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTexts.primaryFontFamily,
    disabledColor: AppColors.grey,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    scaffoldBackgroundColor: AppColors.dark,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
    colorScheme: CustomColorsScheme.darkColorScheme,
    listTileTheme: TListTileTheme.darkListTileTheme,
    dividerTheme: TDividerTheme.darkDividerTheme,
  );
}
