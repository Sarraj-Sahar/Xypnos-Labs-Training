import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/Screens/Home/Home.dart';
import 'package:xypnos_training/Screens/Search/Search.dart';
import 'package:xypnos_training/Screens/MyCourses/MyCourses.dart';
import 'package:xypnos_training/Screens/Account/Account.dart';

import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/MainScreen";

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<MainScreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).appBarTheme.color,
    ));
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          Home(),
          Search(),
          MyCourses(),
          Account(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onTap: onTap,
        selectedIconTheme: IconThemeData(color: kPrimaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
        unselectedLabelStyle: TextStyle(color: Colors.grey[600]),
        unselectedItemColor: Colors.grey[600],
        iconSize: 22,
        selectedFontSize: 12.5,
        selectedItemColor: kPrimaryColor,
        unselectedFontSize: 11,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
