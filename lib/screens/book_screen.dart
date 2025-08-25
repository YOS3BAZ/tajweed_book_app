import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/screens/fahras_search_view.dart';
import 'package:tajweed_book_app/screens/fahras_view.dart';
import 'package:tajweed_book_app/screens/go_to_page_view.dart';
import 'package:tajweed_book_app/widgets/bookmark_button.dart';
import 'package:tajweed_book_app/widgets/dark_mode_button.dart';
import 'package:tajweed_book_app/widgets/menu_view.dart';
import 'package:tajweed_book_app/widgets/pdf_viewer.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookController controller = Get.put(BookController());
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: controller.isDarkMode.value
            ? Colors.black
            : AppColors.primaryBackground,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          titleSpacing: 0,
          toolbarHeight: AppSizes.appBarHeight * 1.1,
          title: Text(
            AppTexts.appName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w700,
                  // fontSize: AppSizes.fontSizeSm,
                  height: AppSizes.fontLineHight,
                ),
          ),
          leading: IconButton(
            tooltip: AppTexts.sideMenu,
            icon: const Icon(
              Iconsax.menu_15,
            ),
            onPressed: () async {
              Get.bottomSheet(
                const AppMenuView(),
                backgroundColor: AppColors.white,
                enableDrag: true,
                isScrollControlled: true,
                clipBehavior: Clip.antiAlias,
              );
            },
          ),
          actions: [
            Obx(
              () => BookmarkButton(
                onPressed: () => controller.toggleBookmark(),
                isBookmarked: controller.isBookmarked.value,
              ),
            ),
            Obx(
              () => DarkModeButton(
                isDarkMode: controller.isDarkMode.value,
                onPressed: controller.toggleDarkMode,
              ),
            ),
            const Tooltip(
              message: AppTexts.search,
              child: FahrasSearchView(),
            ),
          ],
        ),
        extendBody: true,
        body: Obx(
          () => ColorFiltered(
            colorFilter: controller.isDarkMode.value
                ? const ColorFilter.matrix([
                    -1, 0, 0, 0, 255, // Red
                    0, -1, 0, 0, 255, // Green
                    0, 0, -1, 0, 255, // Blue
                    0, 0, 0, 1, 0, // Alpha
                  ])
                : const ColorFilter.mode(Colors.white, BlendMode.darken),
            child: Container(
              padding: const EdgeInsets.only(bottom: 75.0),
              height: double.infinity,
              child: const PDFViewerWidget(
                // darkMode: false,
                backgroundColor: Colors.transparent,
                darkMode: false,
                // backgroundColor: controller.isDarkMode.value
                //     ? Colors.black
                //     : AppColors.primaryBackground,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => ColoredBox(
            color: controller.isDarkMode.value ? Colors.black : Colors.white,
            child: BottomAppBar(
              height: 75.0,
              shape: const CircularNotchedRectangle(),
              notchMargin: AppSizes.sm * 1.4,
              color: AppColors.primary,
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.xs,
                horizontal: AppSizes.sm,
              ),
              child: FutureBuilder(
                future: controller.completer.future,
                builder: (context, snapshot) => snapshot.hasData
                    ? Row(
                        children: [
                          const SizedBox(width: AppSizes.xs),
                          IconButton(
                            tooltip: AppTexts.previous,
                            icon: const Icon(Iconsax.arrow_circle_right),
                            color: AppColors.white,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black26,
                            ),
                            onPressed: () => controller.previousPage(),
                          ),
                          IconButton(
                            tooltip: AppTexts.next,
                            icon: const Icon(Iconsax.arrow_circle_left),
                            color: AppColors.white,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black26,
                            ),
                            onPressed: () => controller.nextPage(),
                          ),
                          const Spacer(),
                          Obx(
                            () => TextButton.icon(
                              iconAlignment: IconAlignment.end,
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black26,
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSizes.sm,
                                  horizontal: AppSizes.md,
                                ),
                              ),
                              icon: const Icon(
                                Iconsax.document_text,
                                size: AppSizes.iconSm,
                                color: AppColors.third,
                              ),
                              label: Text(
                                '${controller.currentPage.value} ${AppTexts.from} ${controller.totalPages.value}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                              onPressed: () {
                                Get.dialog(
                                  const GoToPageView(),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: AppTexts.tableOfContents,
          shape: const CircleBorder(),
          backgroundColor: AppColors.secondary,
          foregroundColor: AppColors.white,
          child: const Icon(Iconsax.document),
          onPressed: () async {
            Get.bottomSheet(
              const FahrasView(),
              backgroundColor: AppColors.white,
              enableDrag: true,
              isScrollControlled: true,
              clipBehavior: Clip.antiAlias,
            );
          },
        ),
      ),
    );
  }
}
