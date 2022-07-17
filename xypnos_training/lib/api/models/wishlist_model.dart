// To parse this JSON data, do
//
//     final wish = wishFromJson(jsonString);

import 'dart:convert';

List<Wish> wishFromJson(String str) =>
    List<Wish>.from(json.decode(str).map((x) => Wish.fromJson(x)));

String wishToJson(List<Wish> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wish {
  Wish({
    this.id,
    this.userId,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int courseId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Wish.fromJson(Map<String, dynamic> json) => Wish(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_id": courseId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
