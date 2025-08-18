import 'package:flutter/material.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';

class CircleImageButton extends StatelessWidget {
  final String imageAsset;
  final double? size;
  final Color? backgroundColor;
  final void Function()? onTap;

  const CircleImageButton({
    super.key,
    required this.imageAsset,
    this.size,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      splashColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Image.asset(
          imageAsset,
          height: size ?? AppSizes.iconLg * 1.2,
          width: size ?? AppSizes.iconLg * 1.2,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
