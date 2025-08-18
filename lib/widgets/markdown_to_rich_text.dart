import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/constants/sizes.dart';

class MarkdownToRichText extends StatelessWidget {
  final String markdownText;

  MarkdownToRichText({super.key, required this.markdownText});

  /// أنماط العناوين
  static const headingStyles = {
    1: TextStyle(
      color: AppColors.secondary,
      fontSize: AppSizes.fontSizeLg,
      height: 2.0,
      fontWeight: FontWeight.w800,
    ),
    2: TextStyle(
      color: AppColors.secondary,
      fontSize: AppSizes.fontSizeLg * 0.9,
      height: 1.9,
      fontWeight: FontWeight.w700,
    ),
    3: TextStyle(
      color: AppColors.third,
      fontSize: AppSizes.fontSizeLg * 0.8,
      height: 1.8,
      fontWeight: FontWeight.w600,
    ),
  };

  /// Regex: bold, italic, link, أو نص عادي
  final _regex = RegExp(r'(\*\*.*?\*\*|_.*?_|\[.*?\]\(.*?\)|[^*_]+)');

  List<TextSpan> _parseLine(String line) {
    TextStyle baseStyle = const TextStyle();

    // العناوين
    int headingLevel = line.startsWith('# ')
        ? 1
        : line.startsWith('## ')
            ? 2
            : line.startsWith('### ')
                ? 3
                : 0;
    if (headingLevel > 0) {
      baseStyle = headingStyles[headingLevel]!;
      line = line.replaceFirst(RegExp(r'^#{1,3} '), '');
    }

    // القوائم
    line = line.replaceFirst(RegExp(r'^\s*-\s+'), '• ');
    // (الأرقام نخليها كما هي: "1. "، "2. " إلخ)

    final spans = <TextSpan>[];

    for (final match in _regex.allMatches(line)) {
      final part = match.group(0)!;

      if (part.startsWith('**') && part.endsWith('**')) {
        spans.add(TextSpan(
          text: part.substring(2, part.length - 2),
          style: baseStyle.merge(const TextStyle(fontWeight: FontWeight.w700)),
        ));
      } else if (part.startsWith('_') && part.endsWith('_')) {
        spans.add(TextSpan(
          text: part.substring(1, part.length - 1),
          style: baseStyle.merge(const TextStyle(fontStyle: FontStyle.italic)),
        ));
      } else if (part.startsWith('[') &&
          part.contains('](') &&
          part.endsWith(')')) {
        final text = part.substring(1, part.indexOf(']'));
        final url = part.substring(part.indexOf('](') + 2, part.length - 1);
        spans.add(TextSpan(
          text: text,
          style: baseStyle.merge(const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline)),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              debugPrint("Open link: $url"); // هنا ممكن تضيف launchUrl لو حاب
            },
        ));
      } else {
        spans.add(TextSpan(text: part, style: baseStyle));
      }
    }
    return spans;
  }

  List<InlineSpan> _parseMarkdown(String text) {
    return text.split('\n').expand((line) {
      if (line.trim().isEmpty) return [const TextSpan(text: '\n')];
      return [..._parseLine(line), const TextSpan(text: '\n')];
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: _parseMarkdown(markdownText),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              height: 2.0,
              fontSize: AppSizes.fontSizeMd,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
