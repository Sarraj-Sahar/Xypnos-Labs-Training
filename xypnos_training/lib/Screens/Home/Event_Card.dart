import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Event_Details/detailedEvent.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import '../../size_config.dart';

// ignore: camel_case_types
class Event_Card extends StatelessWidget {
  final Events event; //event
  const Event_Card(this.event); //this.event

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailedEvent(event: event, index: 0),
          transition: Transition.leftToRightWithFade,
        );
      },
      child: Container(
        width: 250,
        margin: EdgeInsets.only(right: 20),
        height: 230,
        decoration: BoxDecoration(
            // color: Color(0xFF383838),
            // color: Theme.of(context).scaffoldBackgroundColor,

            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  RemoteServices.cover_image_url + event.coverImage,
                  //event.cover
                  fit: BoxFit.cover,

                  height: 159.8,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  event.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
