import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:xypnos_training/api/models/Chapter_model.dart';
import 'package:xypnos_training/api/models/category_Model.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/models/enrolled_course_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xypnos_training/api/models/enrolled_events_model.dart';
import 'package:xypnos_training/api/models/event_model.dart';

class RemoteServices {
  //good practice to have your http client static so we don't have to create it each time we make a call
  static var client = http.Client();
  static String _urlConstant = "http://192.168.1.3:8088/";
  final String _url = _urlConstant + "api/";

  //
  static String cover_image_url = _urlConstant + "storage/cover_images/";
  //
  static String profile_pic_url = _urlConstant + "storage/profiles_pics/";
  //

  static String storage_url = _urlConstant + "storage/";

  //
  FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<List<Chapter>> fetchChapters(apiUrl, id) async {
    String token = await RemoteServices().storage.read(key: "token");
    var fullUrl = RemoteServices()._url + apiUrl + id;

    var response = await client.post(
      Uri.parse(fullUrl),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return chapterFromJson(jsonString);
    } else {
      //show error message
      var jsonString = response.body;
      final jsonResponse = json.decode(jsonString);

      return jsonResponse;
    }
  }

  static postData(data, apiUrl) async {
    var fullUrl = RemoteServices()._url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  //
  static Future<Course> getlatestcourse(apiUrl) async {
    var response = await client.get(
      Uri.parse(RemoteServices()._url + apiUrl),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = (response.body);
      return latestClassFromJson(jsonString);
    } else {
      var jsonString = response.body;
      final jsonResponse = json.decode(jsonString);

      return jsonResponse;
    }
  }

//
  static Future postData3(data, apiUrl) async {
    String token = await RemoteServices().storage.read(key: "token");

    var fullUrl = RemoteServices()._url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<List<Course>> fetchEnrolledInCourse(apiUrl) async {
    String token = await RemoteServices().storage.read(key: "token");
    var fullUrl = RemoteServices()._url + apiUrl;

    var response = await client.post(
      Uri.parse(fullUrl),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonString =
          response.body; //this response is in json format : a string
      final jsonResponse = json.decode(jsonString);
      EnrolledCourses enrolledCourses =
          new EnrolledCourses.fromJson(jsonResponse);

      return (enrolledCourses.courses_en);
    } else {
      //show error message
      // return null;
      var jsonString = response.body;
      final jsonResponse = json.decode(jsonString);

      return jsonResponse;
    }
  }

  static Future<List<Events>> fetchEnrolledInEvents(apiUrl) async {
    String token = await _getToken();
    var fullUrl = RemoteServices()._url + apiUrl;

    var response = await client.post(
      Uri.parse(fullUrl),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonString =
          response.body; //this response is in json format : a string
      final jsonResponse = json.decode(jsonString);
      EnrolledEvents enrolledevents = new EnrolledEvents.fromJson(jsonResponse);

      return (enrolledevents.events);
    } else {
      //show error message
      // return null;
      var jsonString = response.body;
      final jsonResponse = json.decode(jsonString);

      return jsonResponse;
    }
  }

  // static postToken(apiUrl) async {
  //   var fullUrl = RemoteServices()._url + apiUrl + await _getToken();
  //   return await http.post(Uri.parse(fullUrl), headers: _setHeaders());
  // }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  static _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  static _getToken() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance()
    String token = await RemoteServices().storage.read(key: "token");
    return '?token=$token';
  }

  static Future get(apiUrl) async {
    String token = await RemoteServices().storage.read(key: "token");

    // /user/register
    var response = await client.get(
      Uri.parse(RemoteServices()._url + apiUrl),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Events>> fetchEvents(apiUrl) async {
    var response = await client.get(
      Uri.parse(RemoteServices()._url + apiUrl),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return eventsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<Category>> fetchCategories(apiUrl) async {
    var response = await client.get(
      Uri.parse(RemoteServices()._url + apiUrl),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<Course>> fetchCourses(apiUrl, id) async {
    var response = await client.post(
      Uri.parse(RemoteServices()._url + apiUrl + id),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return courseFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<Course>> fetchCourses2(apiUrl) async {
    var response = await client.post(
      Uri.parse(RemoteServices()._url + apiUrl),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return courseFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
