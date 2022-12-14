class Items {
  Items({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String title;
  late final String description;
  late final bool isCompleted;
  late final String createdAt;
  late final String updatedAt;

  Items.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    isCompleted = json['is_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['is_completed'] = isCompleted;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
