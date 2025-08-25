import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/services/services.dart';

class FahrasController extends GetxController {
  static FahrasController get instance => Get.find();

  final BookController _bookController = BookController.instance;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  late int currentIndex;

  int get getCurrentIndex {
    final curentId = AppServices.instance
        .getSectionByPage(_bookController.currentPage.value)
        .id;
    final int cuIndex = curentId > 0 ? curentId : 0;
    return cuIndex;
  }

  void scrollToLastItem() {
    final ii = currentIndex > 0 ? currentIndex - 1 : 0;
    if (ii > 20) {
      itemScrollController.scrollTo(
        alignment: 0.1,
        index: ii,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
      );
    } else {
      itemScrollController.jumpTo(index: ii);
    }
  }

  @override
  void onInit() {
    super.onInit();
    currentIndex = getCurrentIndex;
  }

  @override
  void onReady() {
    super.onReady();
    scrollToLastItem();
  }
}
