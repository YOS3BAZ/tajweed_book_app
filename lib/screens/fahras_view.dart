import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/controllers/fahras_controller.dart';
import 'package:tajweed_book_app/core/constants/app_lists.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/widgets/form_divider.dart';

class FahrasView extends StatelessWidget {
  const FahrasView({super.key});

  BookController get controller => BookController.instance;

  @override
  Widget build(BuildContext context) {
    // controller.scrollToLastItem();

    final FahrasController fahrasController = Get.put(FahrasController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TFormDivider(dividerText: AppTexts.tableOfContents),
        const Divider(
          color: AppColors.borderPrimary,
          thickness: 0.0,
          height: AppSizes.sm,
          indent: AppSizes.md,
          endIndent: AppSizes.md,
        ),
        Expanded(
          child: ScrollablePositionedList.separated(
            itemScrollController: fahrasController.itemScrollController,
            scrollOffsetController: fahrasController.scrollOffsetController,
            itemCount: AppLists.tableOfContents.length,
            itemBuilder: (context, index) {
              final item = AppLists.tableOfContents[index];
              return Card(
                elevation: 0,
                color: Colors.transparent,
                margin: EdgeInsets.only(
                  right: item.type != 1 ? item.type * AppSizes.sm : 0,
                ),
                child: ListTile(
                  tileColor:
                      // controller.currentPage.value == (item.pageNumber - 1)
                      fahrasController.currentIndex + 1 == item.id
                          ? AppColors.accent
                          : AppColors.white,
                  leading: item.type != 3
                      ? Icon(
                          item.type == 1
                              ? Iconsax.book5
                              : item.type == 2
                                  ? Iconsax.document
                                  : null,
                          size: AppSizes.iconMd * 0.8,
                          color: item.type == 1
                              ? AppColors.primary
                              : item.type == 2
                                  ? AppColors.secondary
                                  : null,
                        )
                      : null,
                  title: Text(
                    item.type != 3 ? item.title : "-  ${item.title}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: item.type == 1
                              ? AppColors.primary
                              : item.type == 2
                                  ? AppColors.secondary
                                  : AppColors.textSecondary,
                          fontWeight: item.type == 1
                              ? FontWeight.w800
                              : item.type == 2
                                  ? FontWeight.w700
                                  : FontWeight.w700,
                          height: AppSizes.fontLineHight,
                        ),
                  ),
                  onTap: () {
                    controller.jumpToPage(item.pageNumber - 1);
                    if (Get.isBottomSheetOpen == true) {
                      Get.back();
                    }
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 0.0);
            },
          ),
        ),
      ],
    );
  }
}
