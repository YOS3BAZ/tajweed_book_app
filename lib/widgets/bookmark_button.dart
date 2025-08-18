import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';

class BookmarkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isBookmarked;

  const BookmarkButton({
    super.key,
    required this.onPressed,
    required this.isBookmarked,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: isBookmarked ? AppTexts.removeBookmark : AppTexts.addBookmark,
      color: isBookmarked ? AppColors.third : null,
      isSelected: isBookmarked,
      icon: const Icon(Iconsax.archive_1),
      selectedIcon: const Icon(Iconsax.archive_slash),
      onPressed: onPressed,
    );
  }
}
