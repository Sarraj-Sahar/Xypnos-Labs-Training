import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:xypnos_training/Screens/Course_Details/video_player/basic_overlay_widget.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final bool islooping;

  const VideoPlayerWidget(
      {Key key, @required this.controller, @required this.islooping})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  ChewieController chewieController;

  // void initState() {
  //   chewieController = ChewieController(
  //       looping: widget.islooping,
  //       aspectRatio: 16 / 9,
  //       autoInitialize: true,
  //       videoPlayerController: widget.controller);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   chewieController.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) => widget.controller != null &&
  //         widget.controller.value.isInitialized
  //     ? Container(height: 285, alignment: Alignment.center, child: buildVideo())
  //     : Container(
  //         color: Theme.of(context).appBarTheme.backgroundColor,
  //         height: 300,
  //         width: 100.0,
  //         child: Center(child: CircularProgressIndicator()),
  //       );

  @override
  Widget build(BuildContext context) =>
      widget.controller != null && widget.controller.value.isInitialized
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
            );

//
//
  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          // Positioned.fill(child: BasicOverlayWidget(controller: controller)),
        ],
      );

  Widget buildVideoPlayer() =>
      // AspectRatio(
      //       aspectRatio: controller.value.aspectRatio,
      //       child:
      VideoPlayer(widget.controller);
}


// class VideoDisplay extends StatefulWidget {
//   final String videourl;
//   const VideoDisplay({ Key? key }) : super(key: key);

//   @override
//   _VideoDisplayState createState() => _VideoDisplayState();
// }

// class _VideoDisplayState extends State<VideoDisplay> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }