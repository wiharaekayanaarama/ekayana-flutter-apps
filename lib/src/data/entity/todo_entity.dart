class TodoEntity {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  @override
  String toString() {
    return "{userId: $userId, id: $id, title: $title, completed: $completed}";
  }
}
