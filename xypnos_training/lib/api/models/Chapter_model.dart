// To parse this JSON data, do
//
//     final chapter = chapterFromJson(jsonString);

import 'dart:convert';

List<Chapter> chapterFromJson(String str) =>
    List<Chapter>.from(json.decode(str).map((x) => Chapter.fromJson(x)));

String chapterToJson(List<Chapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapter {
  Chapter({
    this.id,
    this.name,
    this.video,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String video;
  int courseId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        name: json["name"],
        video: json["video"],
        courseId: json["course_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "video": video,
        "course_id": courseId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
