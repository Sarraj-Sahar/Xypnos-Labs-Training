// import 'package:flutter/material.dart';
// import 'package:xypnos_training/api/models/Chapter_model.dart';

// class ChapterContent extends StatefulWidget {
//   final Chapter chapter;
//   final int index;

//   const ChapterContent(this.chapter, this.index);

//   @override
//   _ChapterContentState createState() => _ChapterContentState();
// }

// class _ChapterContentState extends State<ChapterContent> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:video_player/video_player.dart';
import 'package:xypnos_training/Screens/Course_Details/Chapter_details/detailedChapter.dart';
import 'package:xypnos_training/Screens/Course_Details/Instructor.dart';
import 'package:xypnos_training/Screens/Course_Details/video_player/video_widget.dart';
import 'package:xypnos_training/api/models/Chapter_model.dart';
import 'package:xypnos_training/constants.dart';

import '/../size_config.dart';

///// ignore_for_file: deprecated_member_use
import 'package:get/state_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Course_Details/detailedCourse.dart';
import 'package:xypnos_training/api/controllers/course_contoller.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}

class ChapterContent extends StatefulWidget {
  final Chapter chapter;
  final int index;
  ChapterContent(
    this.chapter,
    this.index,
  );

  @override
  _ChapterContentState createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {
  final CourseController courseController = Get.put(CourseController());

  // ignore: deprecated_member_use
  // var chaptersList = List<Chapter>().obs; // Turn this to shared Files list
  var isLoading = true.obs;
  String id;

//Fetch Shared Files
  // void fetchChapters(String id) async {
  //   try {
  //     isLoading(true);
  //     var chapters = await RemoteServices.fetchChapters(
  //         "course?course=", this.widget.course.id.toString());

  //     if (chapters != null) {
  //       chaptersList.value = chapters;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
  //

  @override
  void initState() {
    // fetchChapters(id); // FetchSharedFiles
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildHomeContent(
          // chaptersList, //SharedFilesList
          ),
    );
  }

  Widget buildHomeContent(
      // RxList<Chapter> list
      ) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 15, left: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.chapter.name.capitalize,
                  style: TextStyle(
                      // color: Color(0xFF162349),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 22, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  // stripHtmlIfNeeded(widget.course.courseBrief),
                  "In this Chapter we will learn how to Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    // color: Colors.grey[900],
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Divider(color: Colors.grey),
            ),
            //chapters nb
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 7,
                left: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  // '${widget.chapter.nbsharedFiles}' + " Lessons  ( 11h   56m )",
                  "10 Shared Files",

                  style: TextStyle(
                      // color: Color(0xFF162349),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Divider(color: Colors.grey),
            ),

            // SizedBox(
            //   height: 750,
            //   width: 400.0,
            //   child: Obx(
            //     () {
            //       if (isLoading.value)
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       else
            //         return new ListView.builder(
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: list.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return ChapterTile(list[index], this.widget.course);
            //           },
            //         );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Turn into Shared File Tile
class ChapterTile extends StatefulWidget {
  final Course course;
  final Chapter chapter;
  var chnb = 1;
  ChapterTile(this.chapter, this.course);

  @override
  _ChapterTileState createState() => _ChapterTileState();
}

class _ChapterTileState extends State<ChapterTile> {
  static VideoPlayerController controller;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.network(RemoteServices.storage_url +
  //       widget.course.title +
  //       "/" +
  //       widget.chapter.video)
  //     ..addListener(() => setState(() {}))
  //     ..setLooping(true)
  //     ..initialize().then((_) => controller.play());
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailedChapter(widget.chapter, widget.course, 0),
          transition: Transition.leftToRightWithFade,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          // height: 125,
          height: 65,
          decoration: BoxDecoration(
              // color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 15.0, right: 15.0, bottom: 15),
                    // child: Container(
                    //   height: 75.0,
                    //   width: 100.0,
                    //  child:   VideoPlayerWidget(controller: Lessons().controller),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: NetworkImage(
                    //       RemoteServices.cover_image_url + chapter.video,
                    //     ),
                    //     fit: BoxFit.cover,
                    //   ),
                    //   borderRadius: BorderRadius.circular(3),
                    // ),
                    //

                    //controller
                    //
                    // child: controller != null && controller.value.isInitialized
                    //     ? Container(
                    //         height: 75.0,
                    //         width: 100.0,
                    //         alignment: Alignment.topCenter,
                    //         child: buildVideo())
                    //     : Container(
                    //         height: 75.0,
                    //         width: 100.0,
                    //         child: Center(child: CircularProgressIndicator()),
                    // ),

                    child: Text(
                      // widget.chapter.id.toString() + " ." ?? 'default value',
                      widget.chapter.name[8] + " ." ?? 'default value',

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

                  //controller
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
                          widget.chapter.name ?? 'default value',
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
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            // snapshot.data[index]
                            //     .data()["Duration"],
                            '30 mins ',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(width: 7.5),
                          // Text(
                          //   "${widget.chapter.updatedAt.year}-${widget.chapter.updatedAt.month}-${widget.chapter.updatedAt.day}",
                          //   style: TextStyle(
                          //     color: Theme.of(context)
                          //         .textTheme
                          //         .bodyText1
                          //         .color
                          //         .withOpacity(0.75),
                          //     fontSize: 15.0,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
