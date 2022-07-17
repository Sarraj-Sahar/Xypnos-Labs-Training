import 'splash_data.dart';
import '../main.dart';

import 'font_styles.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Splash_Content_Data extends StatelessWidget {
  final SplashContentData data;

  const Splash_Content_Data({Key key2, this.data}) : super(key: key2);

  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    var paint = Paint()..color = color;

    //Need to wrap the title with spaces, to prevent a flicker during the Hero animation. known issue: https://github.com/flutter/flutter/issues/42988
    var titleText = Text(
      "  ${data.title}  ",
      style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 42,
          foreground: paint,
          height: 2.5,
          package: MyApp.pkg),
    );

    var subTitleText = Text(
      "${data.subTitle}",
      style: TextStyle(
          // fontFamily: "Roboto",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
          package: MyApp.pkg),
    );

    var pic = Image.asset(
      "assets/images/${data.image}.png",
      filterQuality: FilterQuality.high,
      package: MyApp.pkg,
    );
    return Hero(
      tag: "${data.title}${data.key2}",
      //Need to  wrap hero content in a Material so we don't lose text styling while hero is animating. Known issue: https://github.com/flutter/flutter/issues/30647#issuecomment-509712719
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            // titleText,
            SizedBox(width: 250, child: pic),
            SizedBox(
              height: 230,
            ),
            subTitleText
          ],
        ),
      ),
    );
  }
}
