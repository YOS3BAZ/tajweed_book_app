import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
        backgroundColor: isError ? AppColors.error : AppColors.primary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        ),
        content: Text(
          message.toString(),
          style: Theme.of(Get.context!)
              .textTheme
              .bodyLarge
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

  static List<TextSpan> parseTextSpan({
    required String message,
    TextStyle? headlineStyle,
    TextStyle? bodyStyle,
  }) {
    List<TextSpan> spans = [];
    RegExp regex = RegExp(r'\*\*(.*?)\*\*');
    int lastIndex = 0;

    // Find all matches
    for (RegExpMatch match in regex.allMatches(message)) {
      // Add the text before the match
      if (match.start > lastIndex) {
        spans.add(TextSpan(
            text: message.substring(lastIndex, match.start), style: bodyStyle));
      }

      // Add the bold text
      spans.add(
        TextSpan(
          text: match.group(1),
          style: headlineStyle,
        ),
      );

      lastIndex = match.end;
    }

    // Add the remaining text after the last match
    if (lastIndex < message.length) {
      spans.add(TextSpan(text: message.substring(lastIndex)));
    }

    return spans;
  }
}
