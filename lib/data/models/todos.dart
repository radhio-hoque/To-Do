class Todos {
  Todos({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['todo'] = todo;
    _data['completed'] = completed;
    _data['userId'] = userId;
    return _data;
  }
}
