// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/screens/about_screen.dart';
import 'package:tajweed_book_app/screens/book_screen.dart';
import 'package:tajweed_book_app/screens/bookmarks_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const String HOME = "/";
  static const String BOOK = "/Book";
  static const String ABOUT = "/About";
  static const String BOOKMARKS = "/Bookmarks";
  static const String CONTENTS = "/contents";
}

List<GetPage<dynamic>>? pages = [
  GetPage(
    name: AppRoutes.BOOK,
    page: () => const BookScreen(),
    binding: BindingsBuilder.put(() => BookController()),
  ),
  GetPage(
    name: AppRoutes.ABOUT,
    page: () => const AboutScreen(),
  ),
  GetPage(
    name: AppRoutes.BOOKMARKS,
    page: () => const BookmarksScreen(),
  ),
];
