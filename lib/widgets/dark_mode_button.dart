import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tajweed_book_app/core/constants/text_strings.dart';

class DarkModeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isDarkMode;

  const DarkModeButton({
    super.key,
    this.isDarkMode = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: isDarkMode ? AppTexts.lightMode : AppTexts.darkMode,
      icon: Icon(
        isDarkMode ? Iconsax.sun_1 : Iconsax.moon,
      ),
      onPressed: onPressed,
    );
  }
}
