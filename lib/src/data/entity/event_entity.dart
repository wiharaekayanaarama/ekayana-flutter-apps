class EventEntity {
  final int? id;
  final String? title;
  final String? heroImageUrl;
  final String? coverImageUrl;
  final List<String>? images;
  final String? description;
  final String? organizer;
  final String? location;
  final String? address;
  final String? registrationUrl;
  final String? contactUrl;
  final String? mapsUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isActive;

  EventEntity({
    required this.id,
    required this.title,
    required this.heroImageUrl,
    required this.coverImageUrl,
    required this.images,
    required this.description,
    required this.organizer,
    required this.location,
    required this.address,
    required this.registrationUrl,
    required this.contactUrl,
    required this.mapsUrl,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'],
      title: json['title'],
      heroImageUrl: json['heroImageUrl'],
      coverImageUrl: json['coverImageUrl'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      description: json['description'],
      organizer: json['organizer'],
      location: json['location'],
      address: json['address'],
      registrationUrl: json['registrationUrl'],
      contactUrl: json['contactUrl'],
      mapsUrl: json['mapsUrl'],
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      isActive: json['isActive'],
    );
  }
}