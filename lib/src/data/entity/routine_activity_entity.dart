class RoutineActivityEntity {
  final int? id;
  final String? title;
  final String? time;
  final String? location;
  final int? day;
  final String? category;
  final String? startTime;
  final DateTime? startTimeUTC;

  RoutineActivityEntity({
    this.id,
    this.title,
    this.time,
    this.location,
    this.day,
    this.category,
    this.startTime,
    this.startTimeUTC,
  });

  factory RoutineActivityEntity.fromJson(Map<String, dynamic> json) {
    return RoutineActivityEntity(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      location: json['location'],
      day: json['day'],
      category: json['category'],
      startTime: json['startTime'],
      startTimeUTC: json['StartTime'] != null ? DateTime.parse(json['StartTime']) : null,
    );
  }

  @override
  String toString() {
    return 'RoutineActivityEntity{id: $id, title: $title, time: $time, location: $location, day: $day, category: $category, startTime: $startTime, startTimeUTC: $startTimeUTC}';
  }
}