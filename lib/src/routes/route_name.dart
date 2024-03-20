class RouteName {
  static const home = "/";
  static const event = "/event";
  static const eventDetail = "/event/:id";
  static String getEventDetail(int? id) {
    if (id == null) {
      return "/event";
    } else {
      return "/event/$id";
    }
  }

  static const buddavacana = "/buddhavacana";
  static const buddavacanaDetail = "/buddhavacana/detail";
  static const dailyReflection = "/daily-reflection";
  static const aboutEkayana = "/about";
  static const aboutDetailEkayana = "/about-detail-ekayana";
  static const danaInformation = "/donation";
  static const ebooks = "/ebook";
  static const ebookViewer = "/ebook/viewer";
  static String getEbookViewer(String title, String url) {
    return "/ebook/viewer?title=$title&pdfUrl=$url";
  }
  static const routineActivity = "/activities";
}
