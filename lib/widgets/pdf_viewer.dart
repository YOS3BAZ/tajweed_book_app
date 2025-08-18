import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:tajweed_book_app/controllers/book_controller.dart';
import 'package:tajweed_book_app/core/constants/colors.dart';
import 'package:tajweed_book_app/core/helper/logger.dart';
import 'package:tajweed_book_app/core/services/services.dart';

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
    return PDFView(
      pdfData: AppServices.instance.pdfData,
      enableSwipe: true,
      // swipeHorizontal: false,
      // autoSpacing: false,
      // pageFling: true,
      // pageSnap: true,
      defaultPage: controller.currentPage.value,
      fitPolicy: FitPolicy.BOTH,

      backgroundColor: backgroundColor ?? AppColors.primaryBackground,
      // preventLinkNavigation: false,
      onRender: (pages) {
        controller.totalPages.value = pages ?? 0;
        controller.isReady.value = true;
        AppLogger.info("onRender: pages => $pages");
      },
      onError: (error) {
        AppLogger.error(error.toString());
      },
      onPageError: (page, error) {
        AppLogger.error('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        if (!controller.completer.isCompleted) {
          controller.completer.complete(pdfViewController);
        }
        controller.pdfViewController = pdfViewController;
        AppLogger.info("onViewCreated: Compleeeet");
      },
      onPageChanged: (page, total) {
        controller.onPageChanged(page ?? 0);
        AppLogger.info("current page : $page of total $total");
      },
    );
  }
}
