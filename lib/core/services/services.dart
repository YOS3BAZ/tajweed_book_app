import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tajweed_book_app/controllers/menu_controller.dart';
import 'package:tajweed_book_app/core/constants/app_lists.dart';
import 'package:tajweed_book_app/core/constants/asset_strings.dart';
import 'package:tajweed_book_app/core/helper/app_helper.dart';
import 'package:tajweed_book_app/core/helper/logger.dart';
import 'package:tajweed_book_app/models/section_model.dart';

class AppServices extends GetxService {
  static AppServices get instance => Get.find();

  static const String _bookmarkKey = 'bookmarks_list';
  static const String _lastPageKey = 'last_page';
  static const String _darkModeKey = 'darkmode';
  final RxList<SectionModel> bookmarks = <SectionModel>[].obs;
  late Uint8List? pdfData;
  late SharedPreferences prefs;

  String get pdfPathAssets => AppAssets.bookPdf;

  int get lastPageNumber => prefs.getInt(_lastPageKey) ?? 0;

  bool get isDarkMode => prefs.getBool(_darkModeKey) ?? false;

  Future<AppServices> init() async {
    prefs = await SharedPreferences.getInstance();
    loadBookmarks();
    checkForUpdate();
    return this;
  }

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) async {
      AppLogger.info("checkForUpdate : ${info.packageName}");
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.performImmediateUpdate().catchError((e) {
          AppLogger.error("AppUpdateResult.inAppUpdateFailed => $e");
          return AppUpdateResult.inAppUpdateFailed;
        });
        await InAppUpdate.startFlexibleUpdate();
        InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((_) {});
      }
    }).catchError((e) {
      AppLogger.error("checkForUpdate Errror => $e");
    });
  }

  Future<void> saveLastPage(int pageIndex) async {
    await prefs.setInt(_lastPageKey, pageIndex);
  }

  Future<void> saveDarkMode(bool isDark) async {
    await prefs.setBool(_darkModeKey, isDark);
  }

  void loadBookmarks() {
    final savedBookmarks = prefs.getStringList(_bookmarkKey) ?? [];
    bookmarks.value = savedBookmarks.map((e) {
      final item = e.split("&&&");
      return SectionModel(
          id: int.tryParse(item[0]) ?? 0,
          title: "",
          pageNumber: int.tryParse(item[1]) ?? 0);
    }).toList();
  }

  Future<void> saveBookmarks() async {
    bookmarks.sort((a, b) => a.pageNumber.compareTo(b.pageNumber));
    await prefs.setStringList(
      _bookmarkKey,
      bookmarks.map((e) => "${e.id}&&&${e.pageNumber}").toList(),
    );
  }

  void addBookmark({required int pageIndex}) {
    final fahrasItem = getSectionByPage(pageIndex);
    final item = SectionModel(
      id: fahrasItem.id,
      pageNumber: pageIndex,
      title: "",
    );

    if (!bookmarks.contains(item)) {
      bookmarks.add(item);
      saveBookmarks();
    }
  }

  void removeBookmark(int pageIndex) {
    final itemIndex = bookmarks.indexWhere(
      (element) => element.pageNumber == pageIndex,
    );
    if (itemIndex >= 0) {
      bookmarks.removeAt(itemIndex);
      saveBookmarks();
      AppHelper.showSnackBar(message: "تم إزالة الصفحة من المفضلة");
    }
  }

  bool isPageBookmarked(int page) {
    final item = bookmarks.indexWhere((element) => element.pageNumber == page);

    return (item >= 0) ? true : false;
  }

  SectionModel getSectionByPage(int page) {
    final int pageNumber = page + 1;
    final fahrasItem = AppLists.tableOfContents.firstWhere(
      (e) => pageNumber >= e.pageNumber && pageNumber <= e.pageLastNumber,
      orElse: () => const SectionModel(id: 0, pageNumber: 0, title: ""),
    );
    return fahrasItem;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => AppServices().init());
  Get.lazyPut(() => AppMenuController());
  FlutterNativeSplash.remove();
}
