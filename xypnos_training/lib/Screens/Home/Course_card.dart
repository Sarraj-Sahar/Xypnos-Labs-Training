import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

import '../../constants.dart';
import '../../size_config.dart';
import '../Course_Details/detailedCourse.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(this.course);
  //
  final Course course;

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5),
              child: Container(
                width: getProportionateScreenWidth(250),
                height: getProportionateScreenHeight(370),
                child: Card(
                  elevation: 3,
                  color: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                        child: Image.network(
                          RemoteServices.cover_image_url + course.coverImage,
                          height: 190,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Material(
                        elevation: 0.5,
                        shadowColor: Theme.of(context).cardColor,
                        child: Container(
                          height: 45,
                          child: ListTile(
                            isThreeLine: false,
                            onTap: () {},
                            tileColor:
                                Theme.of(context).cardColor.withOpacity(0.3),
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            leading: Transform.translate(
                              offset: Offset(-10, -6),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: AssetImage(
                                  "assets/images/tutor.jpg",
                                ),
                              ),
                            ),
                            title: Transform.translate(
                              offset: Offset(-13, -6),
                              child: Text(
                                // "John Doe",
                                '${course.tutorId}' ?? 'no tutor',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(13),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Transform.translate(
                              offset: Offset(-13, -8),
                              child: Text("Python enthusiast |AI ML"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Text(
                          course.title.capitalize,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(22),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                // snapshot.data[index]
                                //     .data()["Duration"],
                                "30H",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            " ?? ",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${course.nbChapters}' + " Lessons",
                            // course.nbChapters,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(50),
                          ),
                          Obx(
                            () => IconButton(
                              icon: course.isFavorite.value
                                  ? Align(
                                      alignment: Alignment(1.00, 3),
                                      child: Icon(Icons.bookmark),
                                    )
                                  : Align(
                                      alignment: Alignment(1.00, 3),
                                      child: Icon(Icons.bookmark_outline),
                                    ),
                              onPressed: () {
                                course.isFavorite.toggle();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
