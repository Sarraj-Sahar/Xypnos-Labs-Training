// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.emailVerifiedAt,
    this.profilePic,
    this.createdAt,
    this.updatedAt,
    this.privilege,
  });

  int id;
  String name;
  String email;
  String phoneNumber;
  dynamic emailVerifiedAt;
  String profilePic;
  DateTime createdAt;
  DateTime updatedAt;
  String privilege;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        emailVerifiedAt: json["email_verified_at"],
        profilePic: json["profile_pic"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        privilege: json["privilege"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "email_verified_at": emailVerifiedAt,
        "profile_pic": profilePic,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "privilege": privilege,
      };
}
