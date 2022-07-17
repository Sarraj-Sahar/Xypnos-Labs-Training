import 'package:flutter/material.dart';

class ConstellationData {
  final String title;

  final UniqueKey key = UniqueKey();

  ConstellationData(this.title);
}

class DemoData {
  static final List<ConstellationData> _constellations = [
    ConstellationData("Start Now"),
  ];

  List<ConstellationData> getConstellations() => _constellations;
}

/*       Class for Splash DATA      */

class SplashContentData {
  final String title;
  final String subTitle;
  final String image;

  final UniqueKey key2 = UniqueKey();

  SplashContentData(
    this.title,
    this.subTitle,
    this.image,
  );
}

class Shown_Data {
  static final List<SplashContentData> _splashData = [
    SplashContentData(" ", "", "TRAINING 2-1"),
    SplashContentData(" ", "", "TRAINING 2-1"),
    SplashContentData("", "", "TRAINING 2-1"),
  ];

  List<SplashContentData> getSplashData() => _splashData;
}
