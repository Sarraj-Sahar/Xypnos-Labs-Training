import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import 'package:xypnos_training/Screens/Course_Details/Chapter_details/1_Content.dart';
import 'package:xypnos_training/Screens/Course_Details/Chapter_details/2_Assignements.dart';
import 'package:xypnos_training/Screens/Course_Details/Chapter_details/3_MyProgress.dart';
// import 'package:xypnos_training/Screens/Course_Details/video_player/video_widget.dart';
import 'package:xypnos_training/api/models/Chapter_model.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

import 'package:get/get.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailedChapter extends StatefulWidget {
  final Chapter chapter;
  final Course course;
  final int index;
  DetailedChapter(this.chapter, this.course, this.index);

  @override
  _DetailedChapterState createState() => _DetailedChapterState();
}

class _DetailedChapterState extends State<DetailedChapter> {
  static VideoPlayerController controller;
  static ChewieController chewieController;
  //initializing our videoplayeController
// void initState() {
//     chewieController = ChewieController(
//         // looping: widget.islooping,
//         aspectRatio: 16 / 9,
//         autoInitialize: true,
//         videoPlayerController: controller);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     chewieController.dispose();
//     super.dispose();
//   }

  @override
  void initState() {
    chewieController = ChewieController(
        aspectRatio: 16 / 9,
        autoInitialize: true,
        videoPlayerController: controller = VideoPlayerController.network(
            RemoteServices.storage_url +
                widget.course.title +
                "/" +
                widget.chapter.video)

          // ..addListener(() => setState(() {}))
          ..setLooping(false)
          ..initialize().then((_) => controller.pause()));
    //
    // if (this.mounted) {
    //   controller.addListener(() => setState(() {}));
    // }
    super.initState();
    // controller = VideoPlayerController.network(RemoteServices.storage_url +
    //     widget.course.title +
    //     "/" +
    //     widget.chapter.video)
    //   ..addListener(() => setState(() {})) //makes sure to update the video
    //   ..setLooping(false)
    //   ..initialize().then((_) => controller
    //       .pause()); //makes sure that our video is already loaded in our storage
  }

  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: kPrimaryColor,
        tabs: [
          Tab(
            child: Text(
              "Content",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
          Tab(
            child: Text(
              "HomeWork",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
          Tab(
            child: Text(
              "My Progress",
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
          preferredSize: Size.fromHeight(300),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
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
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(EvaIcons.share, color: Colors.white),
              // ),
            ],
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              child: chewieController != null
                  ? Container(
                      height: 285,
                      alignment: Alignment.center,
                      child: Chewie(
                        controller: chewieController,
                      ))
                  : Container(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 300,
                      width: 100.0,
                      child: Center(child: CircularProgressIndicator()),
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
          ChapterContent(this.widget.chapter, this.widget.index),
          Assignments(this.widget.chapter, this.widget.index),
          MyProgress(this.widget.chapter, this.widget.index),
        ]),
      ),
    );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
