import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class AppHelper {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Future<void> copyToClipboard(String value) async {
    await Clipboard.setData(ClipboardData(text: value.toString()));
  }

  static Future<void> openURLBrowser(String textUrl) async {
    try {
      await launchUrlString(
        textUrl,
      );
    } catch (_) {
      AppHelper.showSnackBar(message: "تعذر فتح الرابط", isError: true);
    }
  }

  static void hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static void showSnackBar({required message, bool isError = false}) {
    hideSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 2,
        margin: const EdgeInsets.all(AppSizes.md),
        backgroundColor: isError ? AppColors.error : AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        ),
        content: Text(
          message.toString(),
          style: Theme.of(Get.context!)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  static Future<void> rateInAppStore() async {
    if (Platform.isAndroid) {
      await openURLBrowser(AppTexts.playStoreLink);
    } else if (Platform.isIOS) {
      await openURLBrowser(AppTexts.appleStoreLink);
    }
  }

  static Future<void> shareText({
    String? title,
    required String text,
  }) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          title: title,
          text: text.toString(),
        ),
      );
    } catch (_) {
      showSnackBar(message: "تعذر المشاركة", isError: true);
    }
  }

  static Future<void> sharePdfPage({
    required PdfPageImage page,
    String? title,
    String? text,
  }) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          title: title,
          text: text ?? AppTexts.shareAppText,
          files: [
            XFile.fromData(page.bytes, mimeType: "image/${page.format.name}")
          ],
        ),
      );
    } catch (_) {
      showSnackBar(message: "تعذر المشاركة", isError: true);
    }
  }

  static Future<void> shareImageFromBytes({
    String? title,
    required String text,
    required Uint8List bytes,
  }) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          title: title,
          text: text.toString(),
          subject: "SUUUUUBJEECT",
          files: [
            XFile.fromData(bytes),
          ],
        ),
      );
    } catch (_) {
      showSnackBar(message: "تعذر المشاركة", isError: true);
    }
  }
}
