import 'dart:math';

import 'package:xypnos_training/Splash_Screen/splash_screen_list_content_.dart';

import 'splash_data.dart';
import 'start_button_content.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Splash_Content extends StatefulWidget {
  final SplashContentData data;

  final double hzPadding;

  const Splash_Content({Key key, this.data, this.hzPadding = 0})
      : super(key: key);

  @override
  _Splash_ContentState createState() => _Splash_ContentState();
}

class _Splash_ContentState extends State<Splash_Content> {
  @override
  Widget build(BuildContext context) {
    double rightPadding = 250;
    double leftPadding = 0;
    double vtPadding = 24;
    return GestureDetector(
      child: Transform.translate(
        offset: Offset(-15, 50),
        child: Container(
          padding: EdgeInsets.only(
              top: vtPadding,
              bottom: vtPadding,
              left: leftPadding,
              right: rightPadding),
          alignment: Alignment.center,
          child: Splash_Content_Data(
            data: widget.data,
          ),
        ),
      ),
    );
  }
}
