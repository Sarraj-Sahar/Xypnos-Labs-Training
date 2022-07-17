// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.id,
    this.name,
    this.status,
    this.description,
    this.coverImage,
    this.nbCourses,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int status;
  String description;
  String coverImage;
  int nbCourses;
  DateTime createdAt;
  DateTime updatedAt;

  //
  // We make a fct inside our StudentModel class to map our
  //json data into a CategoryModel object, We will be using a factory method

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        description: json["description"],
        coverImage: json["cover_image"],
        nbCourses: json["nb_courses"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "description": description,
        "cover_image": coverImage,
        "nb_courses": nbCourses,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
