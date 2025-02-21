class EbookEntity {
  int id;
  String title;
  String publisher;
  String? description;
  String fileUrl;
  String coverUrl;
  int viewCount;

  EbookEntity({
    required this.id,
    required this.title,
    required this.publisher,
    this.description,
    required this.fileUrl,
    required this.coverUrl,
    required this.viewCount,
  });

  factory EbookEntity.fromJson(Map<String, dynamic> json) {
    return EbookEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      publisher: json['publisher'] as String,
      description: json['description'] as String?,
      fileUrl: json['fileUrl'] as String,
      coverUrl: json['coverUrl'] as String,
      viewCount: json['viewCount'] as int,
    );
  }

  @override
  String toString() {
    return 'EbookEntity(id: $id, title: $title, publisher: $publisher, fileUrl: $fileUrl, coverUrl: $coverUrl, viewCount: $viewCount)';
  }
}
