import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/constants/app_lists.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/core/services/services.dart';
import 'package:tajweed_book_app/models/section_model.dart';
import 'package:tajweed_book_app/widgets/status_card.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  BookController get _controller => BookController.instance;

  List<SectionModel> get _bookmarksList => AppServices.instance.bookmarks;

  List<SectionModel> get _fahrasList => AppLists.tableOfContents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلة'),
        leading: IconButton(
          tooltip: AppTexts.back,
          icon: const Icon(Iconsax.arrow_right_1),
          onPressed: () async {
            Get.back();
          },
        ),
      ),
      body: Obx(
        () => _controller.favorites.isNotEmpty
            ? ListView.separated(
                itemCount: _bookmarksList.length,
                padding: const EdgeInsets.all(AppSizes.sm),
                itemBuilder: (context, index) {
                  final SectionModel item = _bookmarksList[index];
                  final SectionModel? fahrasItem =
                      item.id > 0 ? _fahrasList[item.id - 1] : null;

                  return Card(
                    elevation: 0,
                    color: Colors.transparent,
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(right: AppSizes.sm),
                      leading: Icon(
                        fahrasItem != null
                            ? fahrasItem.type == 1
                                ? Iconsax.book
                                : fahrasItem.type == 2
                                    ? Iconsax.document
                                    : Iconsax.text_block
                            : Iconsax.book,
                        size: AppSizes.iconMd,
                        color: AppColors.secondary,
                      ),
                      title: Text(
                        item.id > 0
                            ? _fahrasList[item.id - 1].title
                            : "رقم الصفحة: ${item.pageNumber + 1}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              height: AppSizes.fontLineHight,
                            ),
                      ),
                      subtitle: Text("رقم الصفحة: ${item.pageNumber + 1}"),
                      trailing: IconButton(
                        onPressed: () {
                          AppServices.instance.removeBookmark(item.pageNumber);
                        },
                        tooltip: "حذف",
                        color: AppColors.error,
                        iconSize: AppSizes.iconMd * 0.9,
                        icon: const Icon(Iconsax.trash),
                      ),
                      onTap: () {
                        _controller.jumpToPage(item.pageNumber);
                        Get.back();
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    // color: AppColors.,
                    height: 0.0,
                  );
                },
              )
            : const StatusCard(
                icon: Iconsax.archive,
                title: "قائمة المفضلة فارغة حالياً",
                text: "أضف صفحاتك المميزة لتصل إليها بسرعة",
              ),
      ),
    );
  }
}
