// To parse this JSON data, do
//
//     final enrolledCourses = enrolledCoursesFromJson(jsonString);

import 'dart:convert';

import 'package:xypnos_training/api/models/course_model.dart';

//
//this is the method we use to turn json to enrolled model so for displaying en_courses in our app
EnrolledCourses enrolledCoursesFromJson(String str) =>
    EnrolledCourses.fromJson(json.decode(str));

String enrolledCoursesToJson(EnrolledCourses data) =>
    json.encode(data.toJson());

class EnrolledCourses {
  EnrolledCourses({
    // ignore: non_constant_identifier_names
    this.courses_en,
  });

  // ignore: non_constant_identifier_names
  List<Course> courses_en;

  factory EnrolledCourses.fromJson(Map<String, dynamic> json) =>
      EnrolledCourses(
        courses_en:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses": List<dynamic>.from(courses_en.map((x) => x.toJson())),
      };
}
