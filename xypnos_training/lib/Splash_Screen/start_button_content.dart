import 'splash_data.dart';
import '../main.dart';
import 'font_styles.dart';
import 'package:flutter/material.dart';

class ConstellationTitleCard extends StatelessWidget {
  final ConstellationData data;
  final bool redMode;

  const ConstellationTitleCard({Key key, this.data, this.redMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Create paint for our text
    var color = Colors.white;
    var paint = Paint()..color = color;

    //Need to wrap the title with spaces, to prevent a flicker during the Hero animation. known issue: https://github.com/flutter/flutter/issues/42988
    var titleText = Text(
      "  ${data.title}  ",
      style: TextStyle(
          fontSize: 25,
          foreground: paint,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          height: 1.3,
          package: MyApp.pkg),
    );
    // var subTitleText = Text("${data.subTitle}",
    //     style: TextStyle(
    //         fontSize: 16,
    //         fontFamily: Fonts.Content,
    //         color: color,
    //         package: App.pkg));

    return Hero(
      tag: "${data.title}${data.key}",
      //Need to  wrap hero content in a Material so we don't lose text styling while hero is animating. Known issue: https://github.com/flutter/flutter/issues/30647#issuecomment-509712719
      child: Material(
        color: Colors.transparent,
        child: titleText,
      ),
    );
  }
}
