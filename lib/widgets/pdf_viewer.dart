import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/constants/asset_strings.dart';
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
    return PdfViewer.asset(
      AppAssets.bookPdf,
      controller: controller.pdfController,
      initialPageNumber: controller.currentPage.value,
      params: PdfViewerParams(
      
        backgroundColor: backgroundColor ?? Colors.white,
        enableTextSelection: true,
        scaleEnabled: true,
        panEnabled: true,
        panAxis: PanAxis.horizontal,
        onViewerReady: (document, con) {
          controller.totalPages.value = document.pages.length;
          controller.isReady.value = true;
          if (!controller.completer.isCompleted) {
            controller.completer.complete(controller.pdfController);
            controller.pdfDocument = document;
          }
          AppLogger.info("onDocumentLoaded: pages => ${document.pages.length}");
        },
        // onDocumentError: (error) {
        //   AppLogger.error(error.toString());
        // },
        onPageChanged: (page) {
          controller.onPageChanged(page ?? 0);
          AppLogger.info("current page : $page");
        },
      ),
    );
  }
}
