import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajweed_book_app/controllers/menu_controller.dart';
import 'package:tajweed_book_app/core/constants/app_lists.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/models/menu_model.dart';
import 'package:tajweed_book_app/widgets/form_divider.dart';

class AppMenuView extends StatelessWidget {
  const AppMenuView({super.key});

  List<MenuModel> get items => AppLists.homeMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TFormDivider(dividerText: AppTexts.sideMenu),
        const SizedBox(height: AppSizes.md),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: AppSizes.sm,
            crossAxisSpacing: AppSizes.sm,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSizes.sm),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadiusLg),
                      border:
                          Border.all(color: AppColors.primary.withOpacity(0.2)),
                    ),
                    child: Icon(
                      item.icon,
                      size: AppSizes.iconMd * 1.2,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppSizes.md),
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: AppSizes.fontLineHight,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onTap: () {
                if (Get.isBottomSheetOpen == true) {
                  Get.back();
                  AppMenuController.instance.onItemTap(index + 1);
                }
              },
            );
          },
        ),
        const SizedBox(height: AppSizes.md),
      ],
    );
  }
}
