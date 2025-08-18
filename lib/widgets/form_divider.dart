import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../core/helper/app_helper.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key, required this.dividerText, this.textStyle});

  final String dividerText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Divider(
              color: dark ? AppColors.darkGrey : AppColors.grey,
              thickness: 1,
              indent: 40,
              endIndent: 15,
            ),
          ),
          Text(dividerText, style: textStyle ?? Theme.of(context).textTheme.headlineMedium),
          Flexible(
            child: Divider(
              color: dark ? AppColors.darkGrey : AppColors.grey,
              thickness: 1,
              indent: 15,
              endIndent: 40,
            ),
          ),
        ],
      ),
    );
  }
}
