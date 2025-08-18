import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/asset_strings.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/core/helper/app_helper.dart';
import 'package:tajweed_book_app/widgets/circle_image_button.dart';
import 'package:tajweed_book_app/widgets/custom_dialog_template.dart';
import 'package:tajweed_book_app/widgets/form_divider.dart';

class AboutAuthorView extends StatelessWidget {
  const AboutAuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.white,
        insetPadding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: CustomDialogTemplate(
          headerTitle: "عن المؤلف",
          headerIcon: Iconsax.personalcard,
          children: [
            TFormDivider(
              dividerText: "تأليف الشيخ",
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.secondary),
            ),
            Text(
              AppTexts.bookAuthorName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                  ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            const SizedBox(height: AppSizes.sm),
            TFormDivider(
              dividerText: "روابط التواصل",
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.secondary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleImageButton(
                  imageAsset: AppAssets.icWhatsapp,
                  onTap: () {
                    AppHelper.openURLBrowser(AppTexts.authorWhatsAppLink);
                  },
                ),
                CircleImageButton(
                  imageAsset: AppAssets.icTelegram,
                  onTap: () {
                    AppHelper.openURLBrowser(AppTexts.authorTelegramLink);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
