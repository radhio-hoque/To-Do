class Todo {
  Todo({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
  String? id;
  String? createdAt;
  String? updatedAt;
  late final String title;
  late final String description;
  late final bool isCompleted;

  Todo.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
    isCompleted = json['is_completed'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['is_completed'] = isCompleted;
    return data;
  }
}