// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

//this is the method we use to turn json to course model so for displaying courses in our app
List<Course> courseFromJson(String str) => //converting the json string
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

Course latestClassFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    this.id,
    this.title,
    this.courseBrief,
    this.nbChapters,
    this.courseFee,
    this.categoryId,
    this.coverImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tutorId,
  });

  int id;
  String title;
  String courseBrief;
  int nbChapters;
  int courseFee;
  int categoryId;
  String coverImage;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic tutorId;

  var isFavorite = false.obs;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        courseBrief: json["course_brief"],
        nbChapters: json["nb_chapters"],
        courseFee: json["course_fee"],
        categoryId: json["category_id"],
        coverImage: json["cover_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tutorId: json["tutor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "course_brief": courseBrief,
        "nb_chapters": nbChapters,
        "course_fee": courseFee,
        "category_id": categoryId,
        "cover_image": coverImage,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "tutor_id": tutorId,
      };
}
