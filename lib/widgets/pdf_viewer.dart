import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/helper/logger.dart';

class PDFViewerWidget extends StatelessWidget {
  final bool darkMode;
  final Color? backgroundColor;

  const PDFViewerWidget({
    super.key,
    required this.darkMode,
    this.backgroundColor,
  });
  BookController get controller => BookController.instance;

  @override
  Widget build(BuildContext context) {
    return PdfView(
      controller: controller.pdfController,
      backgroundDecoration:
          BoxDecoration(color: backgroundColor ?? Colors.white),
      onDocumentLoaded: (document) {
        controller.totalPages.value = document.pagesCount;
        controller.isReady.value = true;
        if (!controller.completer.isCompleted) {
          controller.completer.complete(controller.pdfController);
          controller.pdfDocument = document;
        }
        AppLogger.info("onDocumentLoaded: pages => ${document.pagesCount}");
      },
      onDocumentError: (error) {
        AppLogger.error(error.toString());
      },
      onPageChanged: (page) {
        controller.onPageChanged(page);
        AppLogger.info("current page : $page");
      },
    );
  }
}
