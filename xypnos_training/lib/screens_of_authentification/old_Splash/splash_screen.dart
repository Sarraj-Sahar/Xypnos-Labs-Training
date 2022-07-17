import 'package:flutter/material.dart';
import 'package:xypnos_training/screens_of_authentification/old_Splash/components/body.dart';
import 'package:xypnos_training/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
