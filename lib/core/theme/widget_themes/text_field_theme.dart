import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: AppSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: AppSizes.fontSizeMd,
        color: AppColors.textSecondary,
        fontFamily: AppTexts.primaryFontFamily),
    hintStyle: const TextStyle().copyWith(
        fontSize: AppSizes.fontSizeSm,
        color: AppColors.textSecondary,
        fontFamily: AppTexts.primaryFontFamily),
    errorStyle: const TextStyle().copyWith(
        fontSize: AppSizes.fontSizeXm,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontFamily: AppTexts.primaryFontFamily),
    floatingLabelStyle: const TextStyle().copyWith(
        color: AppColors.textSecondary, fontFamily: AppTexts.primaryFontFamily),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.borderPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.borderPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.borderSecondary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: AppSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: AppSizes.fontSizeMd,
        color: AppColors.white,
        fontFamily: AppTexts.primaryFontFamily),
    hintStyle: const TextStyle().copyWith(
        fontSize: AppSizes.fontSizeSm,
        color: AppColors.white,
        fontFamily: AppTexts.primaryFontFamily),
    floatingLabelStyle: const TextStyle().copyWith(
        color: AppColors.white.withOpacity(0.8),
        fontFamily: AppTexts.primaryFontFamily),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    errorStyle: const TextStyle().copyWith(
        fontSize: AppSizes.fontSizeXm,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontFamily: AppTexts.primaryFontFamily),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );
}
