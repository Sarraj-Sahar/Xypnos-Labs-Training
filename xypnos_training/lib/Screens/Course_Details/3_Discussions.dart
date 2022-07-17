import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/components/default_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Discussions extends StatefulWidget {
  final Course course;
  final int index;
  Discussions(
    this.course,
    this.index,
  );
  @override
  _DiscussionsState createState() => _DiscussionsState();
}

class _DiscussionsState extends State<Discussions> {
  double rating = 0;

  void rate() async {
    var data = {
      'course_id': this.widget.course.id,
      'rating': this.rating,
    };

    var res = await RemoteServices.postData3(data, 'rate');
    var body = json.encode(res.body);
    print(body);
    if (res.statusCode == 201 || res.statusCode == 200) {
      _showMsg(body);
    } else {
      _showMsg(body);
      print(RemoteServices().storage.read(key: "token"));
    }
  }

  //******************************** */

  // static Future postData3(data, apiUrl) async {
  //   String token = await RemoteServices().storage.read(key: "token");

  //   var fullUrl = "http://192.168.1.4:8088/api/" + apiUrl;
  //   return await http.post(
  //     Uri.parse(fullUrl),
  //     body: jsonEncode(data),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  // }

  // void enroling() async {
  //   var data = {
  //     'c_id': this.widget.course.id,
  //   };

  //   var res = await postData3(data, 'enrol_course');
  //   var body = json.encode(res.body);
  //   print(body);
  //   if (res.statusCode == 201 || res.statusCode == 200) {
  //     _showMsg(body);
  //   } else {
  //     _showMsg(body);
  //     //print(RemoteServices().storage.read(key: "token"));
  //   }
  // }
  //*************************** */

  void enroling() async {
    var data = {
      'c_id': this.widget.course.id,
    };

    var res = await RemoteServices.postData3(data, 'enrol_course');
    var body = json.encode(res.body);
    print(body);
    if (res.statusCode == 201 || res.statusCode == 200) {
      _showMsg(body);
    } else {
      _showMsg(body);
      print(RemoteServices().storage.read(key: "token"));
    }
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      content: Text(
        msg,
        style: TextStyle(
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        // textColor: Color(0xFF684789),
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 20, left: 15, right: 10),
            child: SizedBox(
                child: Text(
                    'By enrolling in this course , you will ONLY be Pre-registred')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
            child: DefaultButton(
              text: "enroll",
              press: () {
                enroling();
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // DefaultButton(
          //   text: "",
          //   press: () => showRating(),
          // ),
          SizedBox(
            height: 50,
          ),
          DefaultButton(
            text: "Rate this course",
            press: () => showRating(),
          ),
        ],
      ),
    );
  }

///////////////////////////////////////////
  /// Ratings Widget ///////////////////////

  Widget buildRating() => RatingBar.builder(
        minRating: 1,
        itemSize: 46,
// itemPadding: EdgeInsets.symmetric(horizontal: ),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        updateOnDrag: true,
        onRatingUpdate: (rating) => setState(() {
          this.rating = rating;
        }),
      );

  void showRating() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Rate this course"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("How statisfied were you with this course ?"),
              const SizedBox(
                height: 32,
              ),
              buildRating(),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => rate(),
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      );
}
