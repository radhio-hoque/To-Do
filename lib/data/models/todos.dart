class Todos {
  Todos({
    this.id,
    required this.todo,
    required this.completed,
    required this.userId,
    this.isDeleted,
  });
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  bool? isDeleted;

  Todos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
