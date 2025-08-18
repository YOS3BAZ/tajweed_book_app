import 'package:get/get.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/core/helper/app_helper.dart';
import 'package:tajweed_book_app/routes.dart';
import 'package:tajweed_book_app/screens/about_author_view.dart';
import 'package:tajweed_book_app/screens/our_channels_view.dart';

class AppMenuController extends GetxController {
  static AppMenuController get instance => Get.find();

  void onItemTap(int index) async {
    if (index == 1) {
      Get.toNamed(AppRoutes.ABOUT);
    } else if (index == 2) {
      Get.dialog(
        const AboutAuthorView(),
      );
    } else if (index == 3) {
      Get.dialog(
        const OurChannelsView(),
      );
    } else if (index == 4) {
      Get.toNamed(AppRoutes.BOOKMARKS);
    } else if (index == 5) {
      // Get.dialog(
      //   const AboutDeveloperView(),
      // );
      await AppHelper.shareText(
        // title: "مشاركة التطبيق",
        text: AppTexts.shareAppText,
      );
    } else if (index == 6) {
      AppHelper.rateInAppStore();
    }
  }
}
