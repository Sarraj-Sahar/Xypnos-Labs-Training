import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:xypnos_training/constants.dart';

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
              child: buildIndicator(context),
            ),
          ],
        ),
      );

  Widget buildIndicator(context) => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
        colors: VideoProgressColors(
            // backgroundColor: Colors.black,
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
            playedColor: Colors.red[900]),
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}
