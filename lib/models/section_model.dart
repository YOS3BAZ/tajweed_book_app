class SectionModel {
  final int id;
  final String title;
  final int pageNumber;
  final int pageLastNumber;
  final int type;
  final bool isExpanded;

  const SectionModel({
    required this.id,
    required this.title,
    required this.pageNumber,
    this.isExpanded = false,
    this.type = 0,
    this.pageLastNumber = 0,
  });
}
