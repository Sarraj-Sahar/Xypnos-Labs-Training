import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xypnos_training/Screens/Course_Details/1_lessons.dart';
import 'package:xypnos_training/Screens/Course_Details/2_Projects.dart';
import 'package:xypnos_training/Screens/Course_Details/3_Discussions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailedCourse extends StatefulWidget {
  final Course course;
  final int index;
  DetailedCourse({Key key, this.course, this.index}) : super(key: key);

  @override
  _DetailedCourseState createState() => _DetailedCourseState();
}

class _DetailedCourseState extends State<DetailedCourse> {
  void addToWishList() async {
    var data = {
      'course_id': this.widget.course.id,
    };

    var res = await RemoteServices.postData3(data, 'wish');
    var body = json.encode(res.body);
    print(body);
    if (res.statusCode == 201 || res.statusCode == 200) {
      // _showMsg(body);
      _showMsg("Added To Wish list");
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

  TabBar get _tabBar => TabBar(
        indicatorColor: kPrimaryColor,
        tabs: [
          Tab(
            child: Text(
              "Lessons",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Projects",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Enrollement",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: AppBar(
            // iconTheme: IconThemeData(
            //   color: Colors.white,
            // ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).textTheme.bodyText1.color),
                onPressed: () {
                  Navigator.of(context).pop(
                    PageTransitionType.topToBottom,
                  );
                }),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(EvaIcons.share, color: Colors.white),
              ),
              Obx(
                () => IconButton(
                  icon: this.widget.course.isFavorite.value
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_outline),
                  onPressed: () {
                    this.widget.course.isFavorite.toggle();
                    addToWishList();
                    // _enroll();
                  },
                ),
              ),
            ],
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      RemoteServices.cover_image_url +
                          this.widget.course.coverImage,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                // color: Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                child: _tabBar,
              ),
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          // Lessons(this.widget.course, this.widget.index),
          Lessons(this.widget.course, this.widget.index),
          Projects(this.widget.course),
          Discussions(this.widget.course, this.widget.index),
        ]),
      ),
    );
  }
}
