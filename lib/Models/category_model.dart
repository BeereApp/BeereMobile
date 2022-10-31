import 'dart:convert';

List<Category> categoryFromMap(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromMap(x)));

String categoryToMap(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Category {
  Category({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}
