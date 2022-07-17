import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

class Projects extends StatefulWidget {
  final Course course;
  Projects(
    this.course,
  );
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  static VideoPlayerController controller;
  final asset = "assets/Vikings Short.mp4.mp4";

  @override
  void initState() {
    super.initState();
    // fetchChapters(id);

    controller = VideoPlayerController.network(RemoteServices.storage_url +
        widget.course.title +
        "/" +
        "VikingsShort.mp4_1631570269.mp4")
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '3 Student Projects',
                  style: TextStyle(
                      // color: Color(0xFF162349),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 8.00),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      // color: Color(0xFF3722d3),
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 8.00),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Learn how to pre-process and visualize your data using Matplotlib and Seaborn libraries. \nThrough this program, you will master the basics of artificial intelligence as well as supervised and unsupervised machine learning algorithms ",
                    style: TextStyle(
                      // color: Colors.grey[900],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 7,
                  left: 8.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '3 Projects',
                    style: TextStyle(
                        // color: Color(0xFF162349),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              SizedBox(
                height: 60,
                child: ListTile(
                  // tileColor: Colors.grey[200],
                  leading: Icon(
                    Icons.list,
                  ),
                  title: Transform.translate(
                    offset: Offset(-16, 0),
                    child: Text(
                      'Project 1 ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Transform.translate(
                    offset: Offset(-16, 0),
                    child: Text(
                      '1H',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Divider(color: Colors.grey),
              ),
              // SizedBox(
              //   height: 60,
              //   child: ListTile(
              //     // tileColor: Colors.grey[200],
              //     leading: Icon(
              //       Icons.lock_outline,
              //     ),
              //     title: Transform.translate(
              //       offset: Offset(-16, 0),
              //       child: Text(
              //         'Project 2',
              //         style:
              //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 1, bottom: 1),
              //   child: Divider(color: Colors.grey),
              // ),
              // SizedBox(
              //   height: 60,
              //   child: ListTile(
              //     // tileColor: Colors.grey[200],
              //     leading: Icon(
              //       Icons.lock_outline,
              //     ),
              //     title: Transform.translate(
              //       offset: Offset(-16, 0),
              //       child: Text(
              //         'Project 3',
              //         style:
              //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 1, bottom: 1),
              //   child: Divider(color: Colors.grey),
              // ),

              VideoPlayerWidget(controller: controller),
              const SizedBox(height: 32),
              if (controller != null && controller.value.isInitialized)
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: IconButton(
                    icon: Icon(
                      isMuted ? Icons.volume_mute : Icons.volume_up,
                      color: Colors.white,
                    ),
                    onPressed: () => controller.setVolume(isMuted ? 1 : 0),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidget(controller: controller)),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: buildIndicator(),
            ),
          ],
        ),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}
