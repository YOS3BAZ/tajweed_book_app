import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/constants/app_lists.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/models/section_model.dart';
import 'package:tajweed_book_app/widgets/status_card.dart';

class FahrasSearchView extends StatelessWidget {
  const FahrasSearchView({super.key});

  List<SectionModel> get itemsList2 => AppLists.tableOfContents;

  List<SectionModel> get itemsList {
    final List<SectionModel> list = [];
    list.addAll(AppLists.tableOfContents);
    list.sort((a, b) => a.title.compareTo(b.title));
    return list;
  }

  BookController get controller => BookController.instance;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: controller.searchController,

      dividerColor: AppColors.grey,
      viewBackgroundColor: AppColors.primaryBackground,
      viewHintText: "ابحث في الفهرس ...",
      headerHintStyle: Theme.of(context).textTheme.bodyMedium,
      headerTextStyle: Theme.of(context).textTheme.headlineSmall,
      isFullScreen: false,
      viewConstraints: const BoxConstraints.tightFor(
        width: double.infinity,
      ),
      viewShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg * 2),
      ),
      viewLeading: IconButton(
        icon: const Icon(Iconsax.arrow_right_1),
        color: AppColors.black,
        onPressed: () => controller.searchController.closeView(null),
      ),
      builder: (context, searchController) {
        return IconButton(
          onPressed: () {
            searchController.openView();
          },
          icon: const Icon(Iconsax.search_normal_1),
        );
      },
      viewBuilder: (suggestions) => suggestions.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md * 0.8,
                vertical: AppSizes.xs,
              ),
              itemCount: suggestions.length,
              itemBuilder: (context, index) => suggestions.toList()[index],
              separatorBuilder: (context, index) => const Divider(
                height: 0.0,
                color: AppColors.borderPrimary,
              ),
            )
          : const StatusCard(
              icon: Iconsax.search_status,
              title: "لا يوجد ما تبحث عنه في الفهرس",
              text: "",
            ),
      // barHintText: 'ابحث عن نص...',
      suggestionsBuilder: (context, searchController) {
        final query = searchController.text.removeAllWhitespace.toLowerCase();
        final results = itemsList2
            .where((item) =>
                item.title.removeAllWhitespace.toLowerCase().contains(query))
            .toList();

        return results.map((item) {
          return Card(
            elevation: 0,
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            ),
            child: ListTile(
              tileColor: Colors.transparent,
              minVerticalPadding: AppSizes.sm,
              leading: Icon(
                item.type == 1
                    ? Iconsax.book
                    : item.type == 2
                        ? Iconsax.document
                        : Iconsax.text_block,
                size: AppSizes.iconMd * 0.8,
                color: AppColors.textPrimary,
              ),
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: AppSizes.fontLineHight,
                    ),
              ),
              onTap: () {
                controller.jumpToPage(item.pageNumber);
                searchController.closeView(null);
              },
            ),
          );
        }).toList();
      },
    );
  }
}
