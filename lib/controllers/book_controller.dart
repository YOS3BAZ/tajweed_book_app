import 'dart:async';

import 'package:flutter/material.dart' show SearchController;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tajweed_book_app/core/constants/asset_strings.dart';
import 'package:tajweed_book_app/core/helper/app_helper.dart';
import 'package:tajweed_book_app/core/services/services.dart';
import 'package:tajweed_book_app/models/section_model.dart';

class BookController extends GetxController {
  static BookController get instance => Get.find();

  final AppServices _pdfService = AppServices.instance;
  final Completer<PdfController> completer = Completer<PdfController>();
  late PdfController pdfController;
  late PdfDocument pdfDocument;
  final SearchController searchController = SearchController();

  final RxBool isReady = false.obs;
  final RxInt currentPage = 0.obs;
  final RxInt totalPages = 0.obs;

  // --
  final RxBool isDarkMode = RxBool(false);
  late RxList<SectionModel> favorites;
  final RxString searchQuery = ''.obs;

  // -- Book Controllers --
  void onPageChanged(int page) async {
    currentPage.value = page;
    _pdfService.saveLastPage(page);
  }

  void jumpToPage(int page) async {
    pdfController.jumpToPage(page);
  }

  void nextPage() async {
    if (currentPage.value < totalPages.value) {
      await pdfController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.linearToEaseOut,
      );
    } else {
      AppHelper.showSnackBar(message: "هذه هي الصفحة الأخيرة");
    }
  }

  void previousPage() async {
    if (currentPage.value > 1) {
      await pdfController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.linearToEaseOut,
      );
    } else {
      AppHelper.showSnackBar(message: "أنت الآن في الصفحة الأولى");
    }
  }

  void toggleDarkMode() async {
    isDarkMode.toggle();
    await _pdfService.saveDarkMode(isDarkMode.value);
    AppHelper.showSnackBar(
        message: "تم تفعيل الوضع ${isDarkMode.value ? 'الليلي' : 'الفاتح'}");
  }

  // -- BookMarks Controllers --
  RxBool get isBookmarked =>
      _pdfService.isPageBookmarked(currentPage.value).obs;

  void toggleBookmark() {
    final int page = currentPage.value;
    if (!isBookmarked.value) {
      _pdfService.addBookmark(
        pageIndex: page,
      );
      AppHelper.showSnackBar(message: "تم إضافة الصفحة إلى المفضلة");
    } else {
      _pdfService.removeBookmark(page);
    }
  }

  // -- On Init --
  @override
  void onInit() {
    super.onInit();
    favorites = _pdfService.bookmarks;
    currentPage.value = _pdfService.lastPageNumber;
    isDarkMode.value = _pdfService.isDarkMode;
    pdfController = PdfController(
      document: PdfDocument.openAsset(AppAssets.bookPdf),
      initialPage: currentPage.value,
    );
  }

  @override
  void onReady() {
    super.onReady();
    if (_pdfService.lastPageNumber > 0) {
      AppHelper.showSnackBar(message: "تم إعادتك إلى آخر صفحة توقفت عندها.");
    }
  }
}
