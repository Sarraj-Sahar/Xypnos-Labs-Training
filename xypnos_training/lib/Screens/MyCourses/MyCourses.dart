import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/MyCourses/WishList.dart';
import 'package:xypnos_training/Screens/MyCourses/enrolled_courses.dart';
import 'package:xypnos_training/Screens/MyCourses/enrolled_events.dart';
import 'package:xypnos_training/Screens/mainScreen.dart';
import 'package:xypnos_training/api/models/enrolled_events_model.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/provider/theme_provider.dart';
import 'package:xypnos_training/size_config.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        title: Text(
          'My Courses',
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: getProportionateScreenWidth(23),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   // child: Image.asset("assets/images/girl.png"),
                    // )
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 50, bottom: 50.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       border: Border.all(
                    //           // color: Colors.white,
                    //           ),
                    //     ),
                    //     // child: Icon(
                    //     //   Icons.play_lesson_outlined,
                    //     //   // color: Color(0xFF162349),
                    //     //   size: 60,
                    //     // ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 100.0,
                        left: 15,
                      ),
                      child: Text(
                        "In progress and saved courses will appear here",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: getProportionateScreenWidth(20),
                            color: Theme.of(context).textTheme.bodyText1.color),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 16),
                child: Text(
                  "All Courses",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(17),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 5),
                child: Divider(color: Colors.grey),
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'My Classes',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 5),
                child: Divider(color: Colors.grey),
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border_outlined),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'Enrolled In Classes',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Enrolled()),
                    // );
                    // Get.to(
                    //   Enrolled(),
                    //   transition: Transition.rightToLeftWithFade,
                    // );
                    Get.to(() => Enrolled());
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border_outlined),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'enrolled in events'.capitalize,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Enrolled()),
                    // );
                    // Get.to(
                    //   MyWishList(),
                    //   transition: Transition.rightToLeftWithFade,
                    // );

                    Get.to(() => EnrolledEventsPage());
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              ListTile(
                leading: Icon(Icons.star_border),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'My Wishlist'.capitalize,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Enrolled()),
                    // );
                    // Get.to(
                    //   MyWishList(),
                    //   transition: Transition.rightToLeftWithFade,
                    // );

                    Get.to(() => MyWishlist());
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
