import 'package:flutter/material.dart';
import 'package:xypnos_training/Screens/Course_Details/detailedCourse.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/size_config.dart';
import 'package:get/get.dart';
import 'package:flutter_image/network.dart';

class newCourseClass extends StatefulWidget {
  const newCourseClass(this.latestcourse);
  //
  final Course latestcourse;

  @override
  State<newCourseClass> createState() => _newCourseClassState();
}

class _newCourseClassState extends State<newCourseClass> {
  @override
  Widget build(BuildContext context) {
    String coursecover;
    if (widget.latestcourse.coverImage.toString() != null) {
      coursecover = RemoteServices.cover_image_url +
          widget.latestcourse.coverImage.toString();
    } else {
      coursecover = "";
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: getProportionateScreenHeight(190),
              width: getProportionateScreenWidth(400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                        coursecover,

                        // loadingBuilder: (context, exception, stackTrack) => CircularProgressIndicator(),
                      ) ??
                      AssetImage('assets/images/TRAINING 2-1.png'),
                ),
              ),
            ),
            Positioned(
              left: 20,
              child: Container(
                width: getProportionateScreenWidth(75),
                height: getProportionateScreenHeight(50),
                decoration: BoxDecoration(
                  color: Color(0xFF4AB9CB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "New ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Colors.white,

                      // color: Color(0xFF42505a),
                      fontSize: getProportionateScreenWidth(25),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12, bottom: 10),
                  child: Text(
                    // "Intrested In Machine Learning ?",
                    "Intrested In ${widget.latestcourse.title} ?",
                    style: TextStyle(
                        letterSpacing: 1.2,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontFamily: "Roboto",
                        fontSize: getProportionateScreenWidth(30),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    bottom: 5,
                  ),
                  child: Text(
                    "Taught by real-world Experts",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      // color: Color(0xFF42505a),
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.8),
                      fontSize: getProportionateScreenWidth(17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 12.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailedCourse(course: widget.latestcourse, index: 0),
                        transition: Transition.leftToRightWithFade,
                      );
                    },
                    child: Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(65),
                      decoration: BoxDecoration(
                        // color: Theme.of(context).cardColor,
                        // color: Color(0xFF4AB9CB),
                        color: Color(0xFF684789),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: Text(
                              "ENROLL NOW ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "2 Days Left !!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                                // color: Color(0xFF42505a),
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
