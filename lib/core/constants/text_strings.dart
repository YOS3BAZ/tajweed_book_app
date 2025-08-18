/// This class contains all the App Text in String formats.
class AppTexts {
  AppTexts._();

  // App Data
  static const String appName = "ملخص التجويد";
  static const String bookAuthorName = "طاهر بن محمد الجباري";
  static const String appVersionTitle = "الإصدار الأول";
  static const String appDescription = "";
  // Share Text
  static const String shortAboutApp =
      "📱 تطبيق كتاب *$appName*:\n\n $appDescription \n \n📥 *حمّل التطبيق الآن :*\n{PLAY_STORE_LINK}\n\n✅ ساهم في نشر التطبيق، فالدال على الخير كفاعله.";

  static final String shareAppText =
      shortAboutApp.replaceAll("{PLAY_STORE_LINK}", playStoreLink);

  // About Book Text
  static const String aboutBookText = "";
  // Author Social Media Links
  static const String authorTelegramLink = "https://t.me/";
  static const String authorWhatsAppLink = "https://wa.me/";

  // Channels Links
  static const String channelTelegramLink = "https://t.me/";
  static const String channelWhatsAppLink = "https://whatsapp.com/channel/";

  // Developer Social Media Links
  static const String devTelegramLink = "";
  static const String devWhatsAppLink = "";

  // Links Of App In Store
  static const String playStoreLink =
      "https://play.google.com/store/apps/details?id=com.tajweed.summary.book.app";
  static const String appleStoreLink = "";

  // Text Strings
  static const String homeTitle = "";
  static const String homeSubtitle = "";

  static const String sideMenu = "خيارات إضافية";
  static const String bookmarks = "المفضلة";
  static const String addBookmark = "إضافة إلى المفضلة";
  static const String removeBookmark = "إزالة من المفضلة";
  static const String search = "بحث";
  static const String lightMode = "الوضع الفاتح";
  static const String darkMode = "الوضع الليلي";

  static const String next = "التالي";
  static const String back = "رجوع";
  static const String previous = "السابق";
  static const String from = "من";
  static const String page = "الصفحة";
  static const String total = "";
  static const String text = "";
  static const String tableOfContents = "محتويات الكتاب";

  // --

  // Fonts Of App
  static const String primaryFontFamily = 'LamaSans';
}
