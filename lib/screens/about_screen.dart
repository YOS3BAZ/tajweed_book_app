import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/widgets/markdown_to_rich_text.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSizes.xs,
        toolbarHeight: AppSizes.appBarHeight,
        title: const Text('عن الكتاب'),
        leading: IconButton(
          tooltip: AppTexts.back,
          icon: const Icon(Iconsax.arrow_right_1),
          onPressed: () async {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: MarkdownToRichText(markdownText: AppTexts.aboutBookText),
        ),
      ),
    );
  }
}

/*
RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: AppHelper.parseTextSpan(
                message: AppTexts.aboutBookText,
                headlineStyle:
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.secondary,
                          fontSize: AppSizes.fontSizeLg,
                          height: 2.0,
                          fontWeight: FontWeight.w800,
                        ),
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 2.0,
                    fontSize: AppSizes.fontSizeMd,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        


 */
