import 'package:flutter/material.dart';
import 'package:xypnos_training/api/models/Chapter_model.dart';

class MyProgress extends StatefulWidget {
  final Chapter chapter;
  final int index;

  const MyProgress(this.chapter, this.index);

  @override
  _MyProgressState createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
