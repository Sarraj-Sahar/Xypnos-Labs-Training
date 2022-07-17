// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Course_Details/detailedCourse.dart';
import 'package:xypnos_training/api/controllers/course_contoller.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

import '../../size_config.dart';

class MyWishlist extends StatefulWidget {
  @override
  _MyWishlistState createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  final CourseController courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        title: Text(
          "My Wishlist",
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: buildHomeContent(courseController.enrolledcoursesList),
    );
  }

  Widget buildHomeContent(RxList<Course> list) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 750,
            width: 400.0,
            child: Obx(
              () {
                if (courseController.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return new ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EnrolledInClassesCard(list[index]);
                    },
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EnrolledInClassesCard extends StatelessWidget {
  final Course course;
  const EnrolledInClassesCard(this.course);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailedCourse(course: course, index: 0),
          transition: Transition.leftToRightWithFade,
        );
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.blueGrey),
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                  child: Container(
                    height: 75.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          RemoteServices.cover_image_url + course.coverImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Expanded(
                      child: Text(
                        course.title ?? 'default value',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.9),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    '${course.tutorId}' ?? 'default value',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.7),
                    ),
                  ),
                  // Flexible(
                  //   child: SizedBox(
                  //       height:
                  //           getProportionateScreenHeight(
                  //               10)),
                  // ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          // snapshot.data[index]
                          //     .data()["Duration"],
                          '12H',
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.75),
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(width: 7.5),
                        Text(
                          "${course.nbChapters}" + " Chapters",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(0.75),
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(80),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_horiz)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
