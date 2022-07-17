// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:xypnos_training/Screens/categories.dart';
// import 'package:xypnos_training/Services/DataContoller.dart';

// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final TextEditingController searchController = TextEditingController();
//   QuerySnapshot snapshotData;
//   bool isExcecuted = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.clear),
//           onPressed: () {
//             setState(() {
//               isExcecuted = false;
//             });
//           }),
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actions: [
//           GetBuilder<DataController>(
//             init: DataController(),
//             builder: (val) {
//               return IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     val.queryData(searchController.text).then((value) {
//                       snapshotData = value;
//                       setState(() {
//                         isExcecuted = true;
//                       });
//                     });
//                   });
//             },
//           )
//         ],
//         title: TextField(
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//               hintText: 'Search Courses',
//               hintStyle: TextStyle(color: Colors.black)),
//           controller: searchController,
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Container(),
//     );
//   }
// }
