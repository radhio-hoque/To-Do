import 'package:to_do/data/models/items.dart';

import 'meta.dart';

class Todo {
  Todo({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
  });
  late final int code;
  late final bool success;
  late final int timestamp;
  late final String message;
  late final List<Items> items;
  late final Meta meta;

  Todo.fromJson(Map<String, dynamic> json){
    code = json['code'];
    success = json['success'];
    timestamp = json['timestamp'];
    message = json['message'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    data['timestamp'] = timestamp;
    data['message'] = message;
    data['items'] = items.map((e)=>e.toJson()).toList();
    data['meta'] = meta.toJson();
    return data;
  }
}