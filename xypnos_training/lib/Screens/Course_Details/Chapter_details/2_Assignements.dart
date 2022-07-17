import 'package:flutter/material.dart';
import 'package:xypnos_training/api/models/Chapter_model.dart';

class Assignments extends StatefulWidget {
  final Chapter chapter;
  final int index;

  const Assignments(this.chapter, this.index);

  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
