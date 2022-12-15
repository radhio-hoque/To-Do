import 'todos.dart';

class Todo {
  Todo({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });
  late final List<Todos> todos;
  late final int total;
  late final int skip;
  late final int limit;

  Todo.fromJson(Map<String, dynamic> json){
    todos = List.from(json['todos']).map((e)=>Todos.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['todos'] = todos.map((e)=>e.toJson()).toList();
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
