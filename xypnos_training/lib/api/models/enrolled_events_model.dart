// To parse this JSON data, do
//
//     final enrolledEvents = enrolledEventsFromJson(jsonString);

import 'dart:convert';

import 'package:xypnos_training/api/models/event_model.dart';

EnrolledEvents enrolledEventsFromJson(String str) =>
    EnrolledEvents.fromJson(json.decode(str));

String enrolledEventsToJson(EnrolledEvents data) => json.encode(data.toJson());

class EnrolledEvents {
  EnrolledEvents({
    this.events,
  });

  List<Events> events;

  factory EnrolledEvents.fromJson(Map<String, dynamic> json) => EnrolledEvents(
        events:
            List<Events>.from(json["events"].map((x) => Events.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}
