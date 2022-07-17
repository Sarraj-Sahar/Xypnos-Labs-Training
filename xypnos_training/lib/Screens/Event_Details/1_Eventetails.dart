import 'package:flutter/material.dart';
import 'package:xypnos_training/Screens/Course_Details/Instructor.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/constants.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}

class EventDetails extends StatefulWidget {
  final Events event;
  final int index;
  EventDetails(
    this.event,
    this.index,
  );

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.widget.event.name.capitalize,
                    style: TextStyle(
                        // color: Color(0xFF162349),

                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 8.00),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 8.00),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    stripHtmlIfNeeded(this.widget.event.description),
                    style: TextStyle(
                      // color: Colors.grey[900],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    Instructor(),
                    transition: Transition.leftToRightWithFade,
                    // arguments: snapshot.data[index]
                  );
                },
                child: Container(
                  // decoration: new BoxDecoration(color: Colors.white),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/tutor.jpg"),
                      child: GestureDetector(onTap: () {}),
                    ),
                    title: Text(
                      "Mohammed Aziz",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Python Expert"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 1, bottom: 1),
              //   child: Divider(color: Colors.grey),
              // ),
              // SizedBox(
              //   height: 60,
              //   child: ListTile(
              //     // tileColor: Colors.grey[200],
              //     leading: Icon(
              //       Icons.list,
              //     ),
              //     title: Transform.translate(
              //       offset: Offset(-16, 0),
              //       child: Text(
              //         '1.   Class Intro',
              //         style:
              //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //     subtitle: Transform.translate(
              //       offset: Offset(-16, 0),
              //       child: Text(
              //         '4:35',
              //         style:
              //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
