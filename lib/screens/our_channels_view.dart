import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/asset_strings.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';
import 'package:tajweed_book_app/core/helper/app_helper.dart';
import 'package:tajweed_book_app/widgets/circle_image_button.dart';
import 'package:tajweed_book_app/widgets/custom_dialog_template.dart';

class OurChannelsView extends StatelessWidget {
  const OurChannelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: CustomDialogTemplate(
        headerTitle: "القنوات الدعوية",
        headerIcon: Iconsax.link_circle,
        children: [
          const SizedBox(height: AppSizes.sm),
          Text(
            "تابع قناة خدمة الرسائل الخيرية \nعلى الواتساب أو التليجرام",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.secondary,
                  height: 2.0,
                ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleImageButton(
                imageAsset: AppAssets.icWhatsapp,
                onTap: () {
                  AppHelper.openURLBrowser(AppTexts.channelWhatsAppLink);
                },
              ),
              CircleImageButton(
                imageAsset: AppAssets.icTelegram,
                onTap: () {
                  AppHelper.openURLBrowser(AppTexts.channelTelegramLink);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
