

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomColorsScheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.black,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    surface: AppColors.softGrey,
    onSurface: AppColors.textPrimary,
    error: AppColors.error,
    onError: AppColors.textWhite,
  );

  // ColorScheme للوضع الغامق
  static final ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.textWhite,
    secondary: AppColors.secondary,
    onSecondary: AppColors.textWhite,
    surface: AppColors.darkContainer,
    onSurface: AppColors.textWhite,
    error: AppColors.error,
    onError: AppColors.textWhite,
  );

}