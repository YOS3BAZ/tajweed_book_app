import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/helper/app_helper.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, this.title, this.text, this.icon, this.color});

  final String? title;
  final String? text;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      // alignment: Alignment.center,
      // padding: const EdgeInsets.all(TSizes.defaultSpace),
      padding: const EdgeInsets.only(
        bottom: AppSizes.defaultSpace * 2,
        top: AppSizes.defaultSpace,
        left: AppSizes.defaultSpace,
        right: AppSizes.defaultSpace,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: dark ? Colors.black12 : AppColors.primary.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon ?? Iconsax.message,
              size: AppSizes.iconLg * 2,
              color: color ?? (dark ? AppColors.white : AppColors.primary),
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          Text(title.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: AppSizes.sm * 1.2),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Text(
              text.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: AppSizes.md),
        ],
      ),
    );
  }
}
