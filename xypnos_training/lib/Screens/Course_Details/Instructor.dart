import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Course_Details/detailedCourse.dart';
import 'package:xypnos_training/Services/Courses_Controller.dart';
import 'package:xypnos_training/api/controllers/course_contoller.dart';

class Instructor extends StatefulWidget {
  @override
  _InstructorState createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {
  final _savedcourses = Set<Container>();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(

    // appBar: AppBar(
    //   toolbarHeight: 250, // Set this height
    //   flexibleSpace: Container(
    //     color: Color(0xFF3722d3),
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 80.0),
    //       child: Column(
    //         children: [
    //           CircleAvatar(
    //             radius: 40,
    //             backgroundImage: AssetImage("assets/images/tutor.jpg"),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             'Mohammed Aziz',
    //             style: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 6,
    //           ),
    //           Text(
    //             'Python Expert',
    //             style: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white,
    //             ),
    //           ),
    //           // SizedBox(
    //           //   height: 6,
    //           // ),
    //           // Text(
    //           //   '"Python is a great first language"',
    //           //   style: TextStyle(
    //           //     fontSize: 16,
    //           //     color: Colors.white,
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Get.to(
                    DetailedCourse(),
                    transition: Transition.leftToRightWithFade,
                  );
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
              toolbarHeight: 250, // Set this height
              flexibleSpace: Container(
                color: Color(0xFF3722d3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/tutor.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Mohammed Aziz',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Python Expert',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      // SizedBox(
                      //   height: 6,
                      // ),
                      // Text(
                      //   '"Python is a great first language"',
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            buildCategory3(),
            buildHomeContent3(),
          ],
        ),
      ),
    );
  }

  Widget buildCategory3() => SliverToBoxAdapter(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 12.0, bottom: 30),
            child: Text(
              "Teaching",
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: Color(0xFF012333),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  Widget buildCategory4() => SliverToBoxAdapter(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 12.0),
            child: Text(
              "Trending Now",
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: Color(0xFF012333),
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  Widget buildHomeContent3() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 410.0,
            width: 400.0,
            child: GetBuilder<CourseController>(
              // changed , used to be data controller   1
              init:
                  CourseController(), // changed , used to be data controller        2
              builder: (value) {
                return FutureBuilder(
                  // future: value.getData('Saved_Courses'),             3
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.white),
                      );
                    } else {
                      return new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(DetailedCourse(),
                                  transition: Transition.leftToRightWithFade,
                                  arguments: snapshot.data[index]);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      width: 250,
                                      height: 380,
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Image.network(snapshot.data[index]
                                                .data()['image']),
                                            Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.grey[100]),
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/tutor.jpg"),
                                                  child: GestureDetector(
                                                      onTap: () {}),
                                                ),
                                                title: Text(
                                                  snapshot.data[index]
                                                      .data()["Instructor"],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle:
                                                    Text("Photoshop Expert"),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                snapshot.data[index]
                                                    .data()["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      snapshot.data[index]
                                                          .data()["Duration"],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data[index]
                                                      .data()["Courses"],
                                                ),
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.bookmark_outline,
                                                  ),
                                                  onPressed: () async {},
                                                  //   await FirebaseFirestore
                                                  //       .instance
                                                  //       .collection("Wish_list")
                                                  //       .add(
                                                  //     {
                                                  //       'name': Get
                                                  //           .arguments['name'],
                                                  //       'Courses':
                                                  //           Get.arguments[
                                                  //               'Courses'],
                                                  //       'Duration':
                                                  //           Get.arguments[
                                                  //               'Duration'],
                                                  //       'Instructor':
                                                  //           Get.arguments[
                                                  //               'Instructor'],
                                                  //       'Price': Get
                                                  //           .arguments['Price'],
                                                  //       'id':
                                                  //           Get.arguments['id'],
                                                  //       'image': Get
                                                  //           .arguments['image'],
                                                  //     },
                                                  //   ).whenComplete(() {
                                                  //     Get.snackbar(
                                                  //       'Saved ! ',
                                                  //       '${Get.arguments['name']} is added to Saved Courses',
                                                  //       colorText: Colors.black,
                                                  //       snackPosition:
                                                  //           SnackPosition.TOP,
                                                  //     );
                                                  //   });
                                                  // },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
      );
}
