import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Home/Course_card.dart';
import 'package:xypnos_training/Screens/Home/Event_Card.dart';
import 'package:xypnos_training/Screens/Home/LatestCourse.dart';
import 'package:xypnos_training/api/controllers/category_controller.dart';
import 'package:xypnos_training/api/controllers/course_contoller.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/provider/theme_provider.dart';
import 'package:xypnos_training/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'new_Course.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instantiating our controllers
  final CourseController courseController = Get.put(CourseController());
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).appBarTheme.color,
            ),
            backwardsCompatibility: false,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Theme.of(context).scaffoldBackgroundColor ==
                        MyThemes.darkTheme.scaffoldBackgroundColor
                    ? Icon(
                        Icons.brightness_3,
                        color: kPrimaryColor,
                      )
                    : Icon(
                        Icons.wb_sunny,
                        color: kPrimaryColor,
                      ),
              ),
            ],
            floating: false,
          ),
          buildNewCourse(courseController.latestCourse),
          buildEvents(categoryController.eventsList),
          buildCourses(courseController.popularcoursesList,
              "Most Popular on xypnos training"),
          buildCourses(courseController.trendingcoursesList, "Trending now"),
          buildCourses(courseController.designcoursesList, "Graphic design"),
        ],
      ),
    );
  }

  Widget buildNewCourse(Rx<Course> course) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            height: 432,
            width: 415,
            child: Obx(
              () {
                if (courseController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  // return ListView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: 1,
                  //   itemBuilder: (context, index) {
                  //     return newCourseClass(allCourses.last);
                  //   },
                  // );
////////////////////////////////////////////////////////////
                  // return StreamBuilder<Object>(
                  //     stream: null,
                  //     builder: (context, snapshot) {
                  //       return LatestCourse(course);
                  //     });
                  ////////////////////////////////////////////////////////////
                  // return FutureBuilder(builder: (context, snapshot) {
                  return LatestCourse(course);
                  // });
                }
              },
            ),
          ),
        ),
      );

  // Widget buildNewCourse(Course course) => SliverToBoxAdapter(
  //       child: Padding(
  //         padding: const EdgeInsets.only(top: 15.0),
  //         child: SizedBox(
  //           height: 431,
  //           width: 415,
  //           child: Obx(
  //             () {
  //               if (courseController.isLoading.value)
  //                 return Center(
  //                   child: CircularProgressIndicator(),
  //                 );
  //               else {
  //                 return LatestCourse(course);
  //               }
  //             },
  //           ),
  //         ),
  //       ),
  //     );

//////////////////////////////////////////////////////////////
  Widget buildCourses(RxList<Course> list, String category) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 9.0),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5, left: 15.0, bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      category.capitalize,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontFamily: "Roboto",
                          fontSize: getProportionateScreenWidth(23),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 410.0,
                width: 400.0,
                child: Obx(
                  () {
                    if (courseController.isLoading.value)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return CourseCard(list[index]);
                        },
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildEvents(RxList<Events> list) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5, left: 15.0, bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "upcoming events".capitalize,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontFamily: "Roboto",
                          fontSize: getProportionateScreenWidth(23),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 240.0,
                width: 400.0,
                child: Obx(
                  () {
                    if (categoryController.isLoading.value)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Event_Card(
                              categoryController.eventsList[index]);
                        },
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
