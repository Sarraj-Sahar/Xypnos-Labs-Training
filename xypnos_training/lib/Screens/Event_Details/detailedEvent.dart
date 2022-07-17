import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:xypnos_training/Screens/Event_Details/1_Eventetails.dart';
import 'package:xypnos_training/Screens/Event_Details/2_Enrollment.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/constants.dart';

class DetailedEvent extends StatefulWidget {
  final Events event;
  final int index;
  DetailedEvent({Key key, this.event, this.index}) : super(key: key);

  @override
  _DetailedEventState createState() => _DetailedEventState();
}

class _DetailedEventState extends State<DetailedEvent> {
  TabBar get _tabBar => TabBar(
        // indicatorColor: Color(0xFF3722d3),
        indicatorColor: kPrimaryColor,
        tabs: [
          Tab(
            child: Text(
              "Event Details",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Enrollment",
              style: TextStyle(
                // color: Color(0xFF162349),
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(EvaIcons.share, color: Colors.white),
              ),
              Obx(
                () => IconButton(
                  icon: this.widget.event.isFavorite.value
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_outline),
                  onPressed: () {
                    this.widget.event.isFavorite.toggle();
                    // _enroll();
                  },
                ),
              ),
            ],
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      RemoteServices.cover_image_url +
                          this.widget.event.coverImage,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                // color: Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                child: _tabBar,
              ),
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          EventDetails(this.widget.event, this.widget.index),
          EventEnrollment(this.widget.event, this.widget.index),
        ]),
      ),
    );
  }
}
