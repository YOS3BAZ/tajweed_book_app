import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';
import 'package:tajweed_book_app/widgets/custom_dialog_template.dart';

class GoToPageView extends StatelessWidget {
  const GoToPageView({super.key});

  BookController get controller => BookController.instance;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    final TextEditingController inputController = TextEditingController();
    return Dialog(
      backgroundColor: AppColors.white,
      child: CustomDialogTemplate(
        headerTitle: "الذهاب إلى صفحة",
        // headerIcon: Iconsax.document,
        children: [
          const SizedBox(height: AppSizes.sm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: Form(
              key: formState,
              child: Column(
                children: [
                  TextFormField(
                    controller: inputController,
                    textInputAction: TextInputAction.go,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: false,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r' ')),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    maxLength: controller.totalPages.value.toString().length,
                    maxLines: 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      final totalPage = controller.totalPages.value;
                      final int pageNumber = int.tryParse(value ?? "0") ?? 0;
                      if (value != null && value.isEmpty) {
                        return "قم بإدخال قيمة";
                      }
                      if (pageNumber < 1 || pageNumber > totalPage) {
                        return "يجب أن يكون بين 1 ~ ${controller.totalPages.value}";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      // hintText: "رقم الصفحة",
                      counterText: "",

                      labelText: "أدخل رقم الصفحة",
                      hintText: "1 ~ ${controller.totalPages.value}",
                      prefixIcon: const Icon(
                        Iconsax.book,
                        size: AppSizes.iconMd * 0.8,
                        color: AppColors.secondary,
                      ),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onFieldSubmitted: (value) {
                      if (formState.currentState?.validate() == true) {
                        final int? pageNumber =
                            int.tryParse(inputController.text);
                        if (pageNumber != null) {
                          controller.jumpToPage(pageNumber);
                        }
                        Get.back();
                      }
                    },
                  ),
                  const SizedBox(height: AppSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.all(AppSizes.md),
                      ),
                      icon: const Icon(
                        Iconsax.document,
                        size: AppSizes.iconSm,
                        color: AppColors.third,
                      ),
                      label: Text(
                        'انتقال للصفحة',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      onPressed: () {
                        if (formState.currentState?.validate() == true) {
                          final int? pageNumber =
                              int.tryParse(inputController.text);
                          if (pageNumber != null) {
                            controller.jumpToPage(pageNumber);
                          }
                          Get.back();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
