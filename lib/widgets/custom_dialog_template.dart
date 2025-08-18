import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';

class CustomDialogTemplate extends StatelessWidget {
  final IconData? headerIcon;
  final String? headerTitle;
  final List<Widget> children;

  const CustomDialogTemplate({
    super.key,
    this.headerIcon,
    this.headerTitle,
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md * 0.8),
      margin: EdgeInsets.zero,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSizes.sm),
                child: Icon(
                  headerIcon,
                  color: AppColors.primary,
                ),
              ),
              Text(
                headerTitle ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
              IconButton(
                icon: const Icon(Iconsax.close_circle),
                color: AppColors.primary,
                onPressed: () => Get.back(),
              ),
            ],
          ),
          const Divider(
            color: AppColors.darkGrey,
            thickness: 0.0,
            height: AppSizes.sm,
            indent: AppSizes.md,
            endIndent: AppSizes.md,
          ),
          const SizedBox(height: AppSizes.sm),
          ...children,
          const SizedBox(height: AppSizes.sm),
        ],
      ),
    );
  }
}
