import 'dart:math';

import 'splash_data.dart';
import 'start_button_content.dart';
import 'package:flutter/material.dart';

// This is for how the "start now " Button is made (container surrouding the "card title" )

class ConstellationListRenderer extends StatefulWidget {
  final ConstellationData data;
  final bool redMode;
  final Function(ConstellationData, bool) onTap;
  final double hzPadding;

  const ConstellationListRenderer(
      {Key key2,
      this.data,
      this.redMode = false,
      this.onTap,
      this.hzPadding = 0})
      : super(key: key2);

  @override
  _ConstellationListRendererState createState() =>
      _ConstellationListRendererState();
}

class _ConstellationListRendererState extends State<ConstellationListRenderer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(),
      child: Transform.translate(
        offset: Offset(0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(
              color: Color(0xFF47c3d4),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          height: 50,
          width: 150,
          alignment: Alignment.center,
          child: ConstellationTitleCard(
            data: widget.data,
          ),
        ),
      ),
    );
  }

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap(widget.data, widget.redMode);
    }
  }
}
