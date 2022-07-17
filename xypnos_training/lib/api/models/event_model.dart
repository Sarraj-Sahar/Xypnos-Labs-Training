// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Events> eventsFromJson(String str) =>
    List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String eventsToJson(List<Events> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
  Events({
    this.id,
    this.name,
    this.description,
    this.fees,
    this.status,
    this.date,
    this.coverImage,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String fees;
  int status;
  DateTime date;
  String coverImage;
  DateTime createdAt;
  DateTime updatedAt;

  var isFavorite = false.obs;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        fees: json["fees"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        coverImage: json["cover_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "fees": fees,
        "status": status,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "cover_image": coverImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
