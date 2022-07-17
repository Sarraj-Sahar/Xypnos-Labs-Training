import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/components/default_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventEnrollment extends StatefulWidget {
  final Events event;
  final int index;
  EventEnrollment(
    this.event,
    this.index,
  );
  @override
  _EventEnrollmentState createState() => _EventEnrollmentState();
}

class _EventEnrollmentState extends State<EventEnrollment> {
  void enroling() async {
    var data = {
      'e_id': this.widget.event.id,
    };

    var res = await RemoteServices.postData3(data, 'enrol_event');
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
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
                height: 50,
                child: Text(
                    'By enrolling in this event , you will ONLY be Pre-registred')),
          ),
          DefaultButton(
            text: "enroll",
            press: () {
              enroling();
            },
          ),
        ],
      ),
    );
  }
}
