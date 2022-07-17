import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Course_Details/detailedCourse.dart';
import 'package:xypnos_training/Screens/Event_Details/detailedEvent.dart';
import 'package:xypnos_training/api/controllers/course_contoller.dart';
import 'package:xypnos_training/api/models/enrolled_events_model.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

import '../../size_config.dart';

class EnrolledEventsPage extends StatefulWidget {
  @override
  _EnrolledEventsState createState() => _EnrolledEventsState();
}

class _EnrolledEventsState extends State<EnrolledEventsPage> {
  final CourseController courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        title: Text(
          "Enrolled In Events",
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: buildHomeContent(courseController.enrolledeventsList),
    );
  }

  Widget buildHomeContent(RxList<Events> list) {
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
                      // return EnrolledInClassesCard(list[index]);
                      return EnrolledInEventsCard(list[index]);
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

class EnrolledInEventsCard extends StatelessWidget {
  final Events event;
  const EnrolledInEventsCard(this.event);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailedEvent(event: event, index: 0),
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
                          RemoteServices.cover_image_url + event.coverImage,
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
                        event.name ?? 'default value',
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
                    event.createdAt.weekday.toString() ?? 'default value',
                    // snapshot.data[index].data()["Instructor"],
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
                        // Text(
                        //   // snapshot.data[index]
                        //   //     .data()["Duration"],
                        //   '12H',
                        //   style: TextStyle(
                        //     color: Theme.of(context)
                        //         .textTheme
                        //         .bodyText1
                        //         .color
                        //         .withOpacity(0.75),
                        //     fontSize: 15.0,
                        //   ),
                        // ),
                        // SizedBox(width: 7.5),
                        Text(
                          "${event.fees}" + " DT",
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
                          width: getProportionateScreenWidth(160),
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
